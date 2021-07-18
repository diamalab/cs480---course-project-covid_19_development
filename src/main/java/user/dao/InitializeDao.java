package user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import java.util.ArrayList;
import java.util.List;

import user.domain.User;
import java.sql.Statement;


public class InitializeDao {
	
	Statement cityS;
	Statement covid_resultsS;
	Statement hospitalsS;
	Statement patientsS;
	Statement stateS;
	Statement tb_userS;
	Statement vaccinatedS;
	Statement vaccineS;
	String sqlstmt;
	
	public void initDB()	{
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
					.getConnection("jdbc:mysql://127.0.0.1:3306/covid_19_development?"
				              + "user=root&password=h123456");
			// Statements allow to issue SQL queries to the database
			covid_resultsS = connect.createStatement();
			covid_resultsS.executeUpdate("DROP TABLE IF EXISTS covid_results");
			sqlstmt = "CREATE TABLE IF NOT EXISTS covid_results " +
					"(ID INTEGER not NULL, " +
					"SSN INTEGER not NULL, " +
					"test_day VARCHAR(45) not NULL, " +
					"results VARCHAR(45) not NULL, " +
					"hospital_id INTEGER not NULL, " +
					"PRIMARY KEY (ID), " +
					"FOREIGN KEY (hospital_id) REFERENCES hospitals (ID) ON DELETE RESTRICT ON UPDATE CASCADE)";
			covid_resultsS.execute(sqlstmt);
			
			
			hospitalsS = connect.createStatement();
			hospitalsS.executeUpdate("DROP TABLE IF EXISTS hospitals");
			sqlstmt = "CREATE TABLE IF NOT EXISTS hospitals " +
					"(ID INTEGER not NULL AUTO_INCREMENT, " +
					"Name VARCHAR(45) not NULL, " +
					"City INTEGER not NULL, " +
					"State INTEGER not NULL, " +
					"Adress VARCHAR(45) not NULL, " +
					"PRIMARY KEY (ID))";
			hospitalsS.execute(sqlstmt);
			
			
			cityS = connect.createStatement();
			cityS.executeUpdate("DROP TABLE IF EXISTS city");
			sqlstmt = "CREATE TABLE IF NOT EXISTS city " +
					"(ID INTEGER not NULL, " +
					"Name VARCHAR(45) not NULL, " +
					"PRIMARY KEY (ID))";
			cityS.execute(sqlstmt);
			
			
			
			
			
			
			
			
			patientsS = connect.createStatement();
			patientsS.executeUpdate("DROP TABLE IF EXISTS patients");
			sqlstmt = "CREATE TABLE IF NOT EXISTS patients " +
					"(SSN INTEGER not NULL, " +
					"Name VARCHAR(45) not NULL, " +
					"DOB DATE not NULL, " +
					"City INTEGER not NULL, " +
					"State INTEGER not NULL, " +
					"Adress VARCHAR(45) not NULL, " +
					"PRIMARY KEY (SSN))";
			patientsS.execute(sqlstmt);
			
			
			stateS = connect.createStatement();
			stateS.executeUpdate("DROP TABLE IF EXISTS state");
			sqlstmt = "CREATE TABLE IF NOT EXISTS state " +
					"(ID INTEGER not NULL, " +
					"Name VARCHAR(45) not NULL, " +
					"PRIMARY KEY (ID))";
			stateS.execute(sqlstmt);
			
			
			tb_userS = connect.createStatement();
			tb_userS.executeUpdate("DROP TABLE IF EXISTS tb_user");
			sqlstmt = "CREATE TABLE IF NOT EXISTS tb_user " +
					"(username VARCHAR(50) not NULL, " +
					"password VARCHAR(50) not NULL, " +
					"email varchar(50) NOT NULL, " +
					"PRIMARY KEY (username))";
			tb_userS.execute(sqlstmt);

			
			vaccinatedS = connect.createStatement();
			vaccinatedS.executeUpdate("DROP TABLE IF EXISTS vaccinated");
			sqlstmt = "CREATE TABLE IF NOT EXISTS vaccinated " +
					"(SSN INTEGER not NULL, " +
					"vaccination_day VARCHAR(45) not NULL, " +
					"doses_taken INTEGER not NULL, " +
					"vaccine_id INTEGER not NULL, " +
					"hospital_id INTEGER not NULL, " +
					"PRIMARY KEY (SSN))";
			vaccinatedS.execute(sqlstmt);
			
			
			vaccineS = connect.createStatement();
			vaccineS.executeUpdate("DROP TABLE IF EXISTS vaccine");
			sqlstmt = "CREATE TABLE IF NOT EXISTS vaccine " +
					"(ID INTEGER not NULL, " +
					"Name VARCHAR(45) not NULL, " +
					"Doses INTEGER not NULL, " +
					"PRIMARY KEY (ID))";
			vaccineS.execute(sqlstmt);
			
			
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	/**
	 * insert User
	 * @param user
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public void add(User user) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://127.0.0.1:3306/covid_19_development?"
				              + "user=root&password=h123456");
			
			
			String sql = "insert into tb_user values(?,?,?)";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,user.getUsername());
		    preparestatement.setString(2,user.getPassword());
		    preparestatement.setString(3,user.getEmail());
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public List<Object> findall() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://127.0.0.1:3306/covid_19_development?"
				              + "user=root&password=h123456");
			
			
			String sql = "select * from tb_user";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				User user = new User();
				user.setUsername(resultSet.getString("username"));
	    		user.setPassword(resultSet.getString("password"));
	    		user.setEmail(resultSet.getString("email"));
	    		list.add(user);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
		
	}
		
}
