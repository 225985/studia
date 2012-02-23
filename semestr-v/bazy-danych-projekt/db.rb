require "yaml"

relations = []

data = YAML.load(readlines.join).map do |model_name, properties|
  File.open("/tmp/java/#{model_name}.java", "w") do |f|
    f.puts("public class #{model_name} {\n" +
    properties.map {|name, type| "    protected #{type} #{name};" }.join("\n") + "\n" +
    properties.map { |name, type|
      [
        "\n    public #{type} get#{name.capitalize}(){ \n        return this.#{name};\n    }\n" +
        "\n    public void set#{name.capitalize}(#{type} #{name}){ \n        this.#{name} = #{name};\n    }"
      ].join("\n")
    }.join("\n") +

    "\n}\n")
  end
end.join("\n")

puts data
puts relations.inspect
