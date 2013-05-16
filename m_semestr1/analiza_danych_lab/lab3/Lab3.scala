import weka.core.converters.ConverterUtils.DataSource
import weka.core.Instances
import weka.filters.Filter
import weka.filters.unsupervised.attribute.Remove
import weka.filters.unsupervised.instance.RemoveWithValues
import weka.core.Attribute
import weka.core.converters.ArffSaver

import java.io._

object Program {

    def getAttrIndexStr(name: String, data: Instances) = (data.attribute(name).index + 1).toString

    def removeValues(options: Array[String], data: Instances) : Instances = {
        var removeValues = new RemoveWithValues
        removeValues.setOptions(options)
        removeValues.setInputFormat(data)
        Filter.useFilter(data, removeValues)
    }

    def removeAttr(options: Array[String], data: Instances) : Instances = {
        var remove = new Remove
        remove.setOptions(options)
        remove.setInputFormat(data)
        Filter.useFilter(data, remove)
    }

    def main(args: Array[String]) {
        val source = new DataSource("181043L2_2.arff")
        val data = source.getDataSet
        if(data.classIndex == -1) data.setClassIndex(data.numAttributes - 1)

        var result = removeValues(Array("-C", getAttrIndexStr("status_pozyczki", data), "-L", "4", "-H"), data)
        result = removeValues(Array("-C",getAttrIndexStr("Kwota_kredytu", data), "-S", "900.01", "-V"), result)
        result = removeAttr(Array("-R", getAttrIndexStr("status_pozyczki", data)), result)

        // save new instance
        val saver = new ArffSaver
        saver.setInstances(result)
        saver.setFile(new File("181043L3_2.arff"))
        saver.writeBatch()
    }
}