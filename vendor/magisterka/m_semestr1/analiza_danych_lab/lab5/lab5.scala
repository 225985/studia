import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.trees.J48;
import weka.classifiers.rules.ZeroR;
import weka.classifiers.rules.JRip;
import weka.classifiers.functions.SMO;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource

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
        
        println("J48")
        test(data, new J48, foldsCount, itt, rnd)

        println("ZeroRules")
        test(data, new ZeroR, foldsCount, itt, rnd)

        println("NaiveBayes")
        test(data, new NaiveBayes, foldsCount, itt, rnd)

        println("ZMO")
        test(data, new SMO, foldsCount, itt, rnd)

        // println("MultilayerPerceptron")
        // test(data, new MultilayerPerceptron, foldsCount, itt, rnd)

        println("JRip")
        test(data, new JRip, foldsCount, itt, rnd)

    }

    def test(instances: Instances, classifier: Classifier, foldsCount: Int, itt: Int, rnd: Random){
        val result = (1 to itt).map{i => crossValidation(instances, classifier, foldsCount, rnd) }
        val t = (result.map(_._1).sum, result.map(_._2).sum, result.map(_._3).sum, result.map(_._4).sum)
        val c = new Criterium(t._1 / itt.toDouble, t._2 / itt.toDouble, t._3 / itt.toDouble, t._4 / itt.toDouble)

        println("Accuracy: " + c.accuracy)
        println("TPrate: " + c.tpRate)
        println("TNrate: " + c.tnRate)
        println("GMean: " + c.gMean)
        println("AUC: " + c.auc)
        c.test
    }

    def crossValidation(instances: Instances, classifier: Classifier, foldsCount: Int, rnd: Random) : (Double, Double, Double, Double) = {
        val eval = new Evaluation(instances)
        eval.crossValidateModel(classifier, instances, foldsCount, rnd)
        val r = eval.confusionMatrix
        (r(0)(0), r(1)(1), r(1)(0), r(0)(1))
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

