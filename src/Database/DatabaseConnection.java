package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
	private Statement mStmt;
	private Connection mConn;

	public DatabaseConnection() throws ClassNotFoundException, SQLException {
		super();

		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		mConn = DriverManager.getConnection(ConfigClass.sJdbcDirver, ConfigClass.sDBUser, ConfigClass.sDBPassword);
		mStmt = mConn.createStatement();

	}

	public void CloseConnection() throws SQLException {
		mStmt.close();
		mConn.close();
	}

	/**
	 * @return the stmt
	 */
	public Statement getStmt() {
		return mStmt;
	}

	/**
	 * @return the conn
	 */
	public Connection getConn() {
		return mConn;
	}

}
