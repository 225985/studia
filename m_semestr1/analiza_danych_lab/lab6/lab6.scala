import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.trees.J48;
import weka.classifiers.rules.ZeroR;
import weka.classifiers.rules.JRip;
import weka.classifiers.functions.SMO;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Instance
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource
import weka.filters.Filter;

import weka.filters.supervised.instance.SMOTE;
import weka.filters.unsupervised.attribute.MergeTwoValues;

import java.io._
import java.util._


object Program {

    def main(args: Array[String]) {
        val source = new DataSource("181043L4_1.arff")
        val data = source.getDataSet
        data.setClassIndex(data.numAttributes - 1)

        val foldsCount = 10
        val itt = 2
        val rnd = new Random(1)
        

        println("J48 - Bare")
        test(data, new J48, foldsCount, itt, 1)
        println("J48 - Smote")
        test(data, new J48, foldsCount, itt, 2)
        println("J48 - SJ")
        test(data, new J48, foldsCount, itt, 3)

        println("-----===|===-----")
        println("ZeroRules - Bare")
        test(data, new ZeroR, foldsCount, itt, 1)
        println("ZeroRules - Smote")
        test(data, new ZeroR, foldsCount, itt, 2)
        println("ZeroRules - SJ")
        test(data, new ZeroR, foldsCount, itt, 3)

        println("-----===|===-----")
        println("NaiveBayes - Bare")
        test(data, new NaiveBayes, foldsCount, itt, 1)
        println("NaiveBayes - Smote")
        test(data, new NaiveBayes, foldsCount, itt, 2)
        println("NaiveBayes - SJ")
        test(data, new NaiveBayes, foldsCount, itt, 3)

        println("-----===|===-----")
        println("SMO - Bare")
        test(data, new SMO, foldsCount, itt, 1)
        println("SMO - Smote")
        test(data, new SMO, foldsCount, itt, 2)
        println("SMO - SJ")
        test(data, new SMO, foldsCount, itt, 3)
        
        println("-----===|===-----")
        println("JRip - Bare")
        test(data, new JRip, foldsCount, itt, 1)
        println("JRip - Smote")
        test(data, new JRip, foldsCount, itt, 2)
        println("JRip - SJ")
        test(data, new JRip, foldsCount, itt, 3)


    }

    def test_bare(instances: Instances, classifier: Classifier, foldsCount: Int, itt: Int, rnd: Random){
        val result = (1 to itt).map{i => crossValidation(instances, classifier, foldsCount, rnd) }
        val t = (result.map(_._1).sum, result.map(_._2).sum, result.map(_._3).sum, result.map(_._4).sum)
        val c = new Criterium(t._1 / itt.toDouble, t._2 / itt.toDouble, t._3 / itt.toDouble, t._4 / itt.toDouble)
        printResult(c)
    }

    def crossValidation(instances: Instances, classifier: Classifier, foldsCount: Int, rnd: Random) : (Double, Double, Double, Double) = {
        val eval = new Evaluation(instances)
        eval.crossValidateModel(classifier, instances, foldsCount, rnd)
        val r = eval.confusionMatrix
        (r(0)(0), r(1)(1), r(1)(0), r(0)(1))
    }


    // type: 1 - bare, 2 - smote, 3 - sj
    def test(instances: Instances, classifier: Classifier, foldsCount: Int, itt: Int, t: Int){
        var tp = 0
        var tn = 0
        var fn = 0
        var fp = 0
        (1 to itt).foreach{ it => 
            val folds = foldSplit(new Instances(instances), foldsCount)
            (0 until foldsCount).foreach{ fold => 
                val tmpData = new Instances(folds(fold), 1)
                (0 until foldsCount).filter{i => i != fold}.foreach{ i =>
                    (0 until folds(i).numInstances).foreach{ j => 
                        tmpData.add(folds(i).instance(j))
                    }
                }
                if(t == 1) {
                    classifier.buildClassifier(folds(fold))
                }
                if(t == 2) {
                    classifier.buildClassifier(getSmote(tmpData))
                } else {
                    classifier.buildClassifier(getSJ(tmpData))
                }

                
                (0 until tmpData.numInstances).foreach{ j => 
                    if(tmpData.instance(j).value(8) != 0){
                        if (classifier.classifyInstance(tmpData.instance(j)) != 0) {
                            tp = tp + 1
                        } else {
                            fn = fn + 1
                        }
                    } else {
                        if (classifier.classifyInstance(tmpData.instance(j)) != 0) {
                            fp = fp + 1
                        } else {
                            tn = tn + 1
                        }
                    }
                }

            }    
        }

        val c = new Criterium(tn/itt, tp/itt, fn/itt, fp/itt)
        printResult(c)
    }

    

    def foldSplit(instances: Instances, foldsCount: Int) : Array[Instances] = {
        val result = new Array[Instances](foldsCount)
        (0 until foldsCount).foreach(i => result(i) = new Instances(instances, 1))
        val foldSize = instances.numInstances / foldsCount
        val fullFolds = new Array[Boolean](foldsCount)
        val rnd = new Random()
        while(fullFolds.filter{i => i == false}.size > 0 && instances.numInstances > 0){
            val rndVal = rnd.nextInt(instances.numInstances)
            val rndFold = rnd.nextInt(foldsCount)
            if(result(rndFold).numInstances < foldSize){
                result(rndFold).add(instances.instance(rndVal))
                instances.delete(rndVal)
            } else if(!fullFolds(rndFold)){
                fullFolds(rndFold) = true
            }
            
        }
        if(instances.numInstances > 0){
            (0 until instances.numInstances).foreach{i => result(i).add(instances.instance(i))}
        }
        result
    }

    def getSmote(instances: Instances) : Instances = {
        val smote = new SMOTE();      
        smote.setInputFormat(instances);
        smote.setPercentage(300.0);
        smote.setRandomSeed(1);
        smote.setNearestNeighbors(5);               
        Filter.useFilter(instances, smote);       
    }

    def getSJ(instances: Instances) : Instances = {
        val sjTrain = new Instances(instances, 0)
        val negSet = new Instances(instances)
        val posSet = new Instances(instances, 0)
        var deleted = 0

        for(i <- 0 until negSet.numInstances){
            if(negSet.instance(i - deleted).value(8) != 0){
                posSet.add(negSet.instance(i - deleted))
                negSet.delete(i - deleted)
                deleted = deleted + 1
            }
        }
        val rnd = new Random
        val randVal = rnd.nextInt(negSet.numInstances)
        val rndInstance = negSet.instance(randVal)

        sjTrain.add(rndInstance)

        for(i <- 0 until negSet.numInstances){
            var posDistance = 10;
            if(i != randVal){
                val negDistance = countDistance(rndInstance, negSet.instance(i))
                (0 until posSet.numInstances).foreach { j => 
                    val tmpDist = countDistance(rndInstance, posSet.instance(j))
                    if(tmpDist < posDistance) posDistance = tmpDist
                }

                if(posDistance <= negDistance) sjTrain.add(negSet.instance(i))
            }
        }
        (0 until posSet.numInstances).foreach{i => sjTrain.add(posSet.instance(i))}
        sjTrain

    }

    def countDistance(in1: Instance, in2: Instance) = 
        (0 until in1.numAttributes).filter{i => in1.value(i) != in2.value(1)}.size

    def printResult(c : Criterium) {
        println("Accuracy: " + c.accuracy)
        println("TPrate: " + c.tpRate)
        println("TNrate: " + c.tnRate)
        println("GMean: " + c.gMean)
        println("AUC: " + c.auc)
    }

    class Criterium(tn: Double, tp: Double, fn: Double, fp: Double) {
        def accuracy() = (tp + tn) / (tp + tn + fp + fn)
        def tnRate() = tn / (tn + fp)
        def tpRate() = tp / (tp + fn)
        def gMean() = Math.sqrt(tnRate() * tpRate())
        def fpRate() = fp / (fp + tn)
        def auc() = (1 + tpRate() - fpRate()) / 2
        def test(){
            println("tp: " + tp + " tn: " + tn + " fn: " + fn + " fp: " + fp)
        }
    }

}

