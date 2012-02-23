package db;

public class Bench {
  public static final int N = 1000;

  public static void b1(){
    long t;

    int[] ks = new int[]{100, 200, 400, 800, 1600, 3200};

    for(int x=0; x<10; x++){
      System.out.println("Take " + x);
      for(int k : ks){
        loadData(k);
        t = System.currentTimeMillis();
        for(int i=0; i<N; i++){
          Project.find(i);
        }
        t = System.currentTimeMillis() - t;
        System.out.println(k + " - " + t);
      }
    }
  }

  public static void b2(){
    long t;

    int[] ks = new int[]{1, 10, 100, 1000, 10000};

    for(int x=0; x<10; x++){
      System.out.println("Take " + x);
      for(int k : ks){
        System.out.print("k = " + k + " => ");
        t = System.currentTimeMillis();
        for(int i=1; i<=10000; i++){
          User user = new User();
          user.setLogin("test");
          user.setEmail("test@test.com");

          Database.odb.store(user);
          if(i % k == 0) Database.odb.commit();
        }
        t = System.currentTimeMillis() - t;
        System.out.println(t);
      }

    }


  }

  public static void main(String[] args) {
    Database.init("/tmp/bench" + java.util.UUID.randomUUID().toString() + ".db");

    // b1();
    b2();

    System.out.println("done");
  }

  public static void loadData(int n){
    System.out.print("Saving " + n + " objects...");
    for(User u : User.all()){
      u.destroy();
    }
    System.out.print("....");

    for(int i=0; i<n; i++){
      User user = new User();
      user.setLogin("test");
      user.setEmail("test@test.com");
      user.save();
    }
    System.out.println("done");
  }
}