### How to run

    $ sbt assembly
    $ cat in.txt | java -jar target/pea-projekt1-assembly-0.1-SNAPSHOT.jar TASKS INSTANCES

### input format

    GA n k    # n - iterations, k - population size
    TS n k t  # n - iterations, k - diversification, t - tabu size
    SA td     # td - time factor
