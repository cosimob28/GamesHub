import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;

import org.dbunit.database.DatabaseConfig;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;

public class DatabaseExport {
	public static void main(String[] args) throws Exception
    {
        // database connection
        Class driverClass = Class.forName("com.mysql.jdbc.Driver");
        Connection jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
        IDatabaseConnection connection = new DatabaseConnection(jdbcConnection);
        DatabaseConfig dbConfig = connection.getConfig();

        // added this line to get rid of the warning
        dbConfig.setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new MySqlDataTypeFactory());
        // full database export
       IDataSet fullDataSet = connection.createDataSet();
       FlatXmlDataSet.write(fullDataSet, new FileOutputStream("test/full.xml"));
        
               
        
    }
}
