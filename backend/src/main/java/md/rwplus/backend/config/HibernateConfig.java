package md.rwplus.backend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration  //arata ca clasa contine mai multe binuri notate cu @Bean
@ComponentScan(basePackages = {"md.rwplus.backend"})
@EnableTransactionManagement 
public class HibernateConfig {
	//Database Connection
	private static final String DATABASE_URL = "jdbc:h2:tcp://localhost/~/tulipDB";
	private static final String DATABASE_DRIVER = "org.h2.Driver";
	private static final String DATABASE_DIALECT = "org.hibernate.dialect.H2Dialect";
	private static final String DATABASE_USERNAME = "Dancik__";
	private static final String DATABASE_PASSWORD = "079176572d";
	        
	//dataSource will provide the necessary connection information from the database
	@Bean("dataSource")
	public DataSource getDataSource(){
		
		BasicDataSource dataSource = new BasicDataSource();
	 
		//providing the database conection information
		dataSource.setDriverClassName(DATABASE_DRIVER );
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);
		
		return dataSource;
	}
	
	//SesionFactory  will use data source, provide o session for particularly user 
	//if session is create we will create a query, and execute within the transaction
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource){
		 
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("md.rwplus.backend");
		
		return builder.buildSessionFactory();
		
		
		
	}
   // All the Hibernate Properties will be returned in this method
	private Properties getHibernateProperties() {
		
		Properties properties = new Properties();
		
		properties.put("hibernate.dialect", DATABASE_DIALECT);
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		
	//	properties.put("hibernate.hbm2ddl.auto", "create"); //create  table if is not there or update if is there
		
	 //properties.put("hibernate.hbm2ddl.auto", "update");  //nu va sterge datele din tabele
		
		return properties;
	}
	
	//to manage the transactions to execute that particularly query
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager; 
	}

}
