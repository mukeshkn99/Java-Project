package application;

import java.io.*;

import java.sql.*;


import org.supercsv.cellprocessor.constraint.NotNull;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvBeanReader;
import org.supercsv.io.ICsvBeanReader;
import org.supercsv.prefs.CsvPreference;


public class file {
 	



	public static void main(String[] args) {
    	
        String jdbcURL = "jdbc:mysql://localhost:3306/treatement";
        String username = "root";
        String password = "admin";
 
        String csvFilePath = "D:/symtoms.csv";
 
        int batchSize = 20;
      
        Connection connection = null;
        
        ICsvBeanReader beanReader=null;
        
		
		
		CellProcessor[] processors=new CellProcessor[]
        		{
        			   new NotNull(),//age
         			   new NotNull(),//gender
         			   new NotNull(),//pressure
         			   new NotNull(),//cholestral
          			   new NotNull(),//sugar
         			   new NotNull(),//electrocardiograph
         		       new NotNull(),//heartrate
         			   new NotNull(),//angina
         			   new NotNull(),//strest
         			   new NotNull(),//symtoms
         			   new NotNull(),//disease
         			   	   
        		};
 
        try {
        	long start=System.currentTimeMillis();
        	
        	Class.forName("com.mysql.jdbc.Driver");
        	connection = DriverManager.getConnection(jdbcURL,username,password);
            
            connection.setAutoCommit(false);
 
            String sql = "INSERT INTO upload(age,gender,pressure,cholestral,sugar,electrocardiograph,heartrate,angina,strest,symtoms,disease) VALUES (?,?,?,?,?,?,?,?,?,?,?)";            
            		PreparedStatement statement = connection.prepareStatement(sql);
 
            beanReader = new CsvBeanReader(new FileReader(csvFilePath),CsvPreference.STANDARD_PREFERENCE);
            
 
            beanReader.getHeader(true); // skip header line
            
            String[] header={"age","gender","pressure","cholestral","sugar","electrocardiograph","heartrate","angina","strest","symtoms","disease"};
           Review bean=null;
           
           int count=0;
           
			

			while ((bean=beanReader.read(Review.class,header,processors))!=null) {
                String age = bean.getAge();
                System.out.println("age"+age);
                String gender = bean.getGender();
                System.out.println("Gender"+gender);
                String pressure =bean.getPressure();
                System.out.println("pressure"+pressure);
                String cholestral=bean.getCholestral();
                System.out.println("cholestral"+cholestral);
                String sugar = bean.getSugar();
                System.out.println("sugar"+sugar);
                String electrocardiograph=bean.getElectrocardiograph(); 
                System.out.println("electrocardiograph"+electrocardiograph);
                String heartrate= bean.getHeartrate();
                System.out.println("heartrate"+heartrate);
                String angina = bean.getAngina();
                System.out.println("angina"+angina);
                String strest =bean.getStrest();
                System.out.println("strest"+strest);
                String symtoms =bean.getSymtoms(); 
                System.out.println("symtoms"+symtoms);
                String disease =bean.getDisease(); 
                System.out.println("disease"+disease);
                
 
                
 
                statement.setString(1, age);
                statement.setString(2, gender);
                statement.setString(3, pressure);
                statement.setString(4, cholestral);
                statement.setString(5, sugar);
                statement.setString(6, electrocardiograph);
                statement.setString(7, heartrate);
                statement.setString(8, angina);
                statement.setString(9, strest);
                statement.setString(10, symtoms);
                statement.setString(11, disease);
                    
                
 
                statement.addBatch();
 
                if (count % batchSize == 0) {
                    statement.executeBatch();
                }
            }
 
            beanReader.close();
 
            // execute the remaining queries
            statement.executeBatch();
 
            connection.commit();
            connection.close();
            
            long end=System.currentTimeMillis();
            System.out.println(+(end-start));
        }
            catch(Exception e)
    		{
    			e.printStackTrace();
    		}
        
}


}
