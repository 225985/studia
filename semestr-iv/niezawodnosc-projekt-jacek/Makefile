all:
	mvn clean compile assembly:assembly
	mv target/niduc-0.1.0-jar-with-dependencies.jar test.jar
	rm -rf test/result_png/*.png test/out_png/*.png test/result_txt/*.txt test/out_txt/*.txt test/results/*.txt
	java -server -jar test.jar 1 5000000 1440 4
	
clean:
	mvn clean
	rm -rf test.jar test/result_png/*.png test/out_png/*.png test/result_txt/*.txt test/out_txt/*.txt test/results/*.txt
