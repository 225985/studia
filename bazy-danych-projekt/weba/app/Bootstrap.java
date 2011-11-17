import play.*;
import play.jobs.*;

import db.*;

@OnApplicationStart
public class Bootstrap extends Job {
    public void doJob(){
        Database.init("/tmp/db07.db");
    }
}
