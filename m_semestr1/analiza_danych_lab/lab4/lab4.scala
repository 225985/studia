import weka.core.converters.ConverterUtils.DataSource
import weka.core.Instances
import weka.filters.Filter
import weka.filters.unsupervised.instance.RemoveWithValues  
import java.io._

object Program {

    def removeValues(options: Array[String], data: Instances) : Instances = {
        val removeValues = new RemoveWithValues
        removeValues.setOptions(options)
        removeValues.setInputFormat(data)
        Filter.useFilter(data, removeValues)
    }

    def hClass(data: Instances) : Double = {
        val tmpData = removeValues(Array("-S", "0.0", "-C", "9", "-L", "2", "-V"), data)
        val p = (tmpData.numInstances().toDouble / data.numInstances().toDouble,
                 (data.numInstances - tmpData.numInstances).toDouble / data.numInstances.toDouble)
        -(p._1 * Math.log(p._1) + p._2 * Math.log(p._2))
    }

    def hAttr(attr: Integer, data: Instances) : Double = {
        val p = (1 to data.attribute(attr).numValues).map(i => 
                removeValues(Array("-S", "0.0", "-C", (attr + 1).toString(), "-L", i.toString(), "-V"), data).numInstances.toDouble / data.numInstances.toDouble )
        p.filter{e => e > 0.0}.map(e => e * Math.log(e)).sum * -1
    }

    def hClassAttr(data: Instances, attr: Integer, cl: Integer) : Double = {
        val h = (1 to data.attribute(attr).numValues).map{i => 
            val tmpData = removeValues(Array("-S", "0.0", "-C", (attr + 1).toString(), "-L", i.toString(), "-V"), data);
            (hAttr(8, tmpData), tmpData.numInstances.toDouble / data.numInstances.toDouble)
        } 
        h.map(e => e._1 * e._2).sum.toDouble
    }
    
    def gainRatioAttributeEval(data: Instances, i: Integer) : Double = 
        (hClass(data)- hClassAttr(data, i, 8))/hAttr(i, data) 
    

    def main(args: Array[String]) {
        val source = new DataSource("181043L4_1.arff")
        val data = source.getDataSet
        if(data.classIndex == -1) data.setClassIndex(data.numAttributes - 1)
        (0 until data.numAttributes()-1).foreach(i => 
            println(data.attribute(i).name + " " + gainRatioAttributeEval(data, i).toString()))
    }
}