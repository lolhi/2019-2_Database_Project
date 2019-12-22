package Database;

public class CustomerInfomation {
	private String sId;
	private String sPassword;
	private String sName;
	private int iAge;
	private String sAddress;
	private String sProperty;
	private double dMoney;
	
	public CustomerInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerInfomation(String sId, String sPassword, String sName, int iAge, String sAddress, String sProperty,
			double dMoney) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sName = sName;
		this.iAge = iAge;
		this.sAddress = sAddress;
		this.sProperty = sProperty;
		this.dMoney = dMoney;
	}

	/**
	 * @return the sId
	 */
	public String getsId() {
		return sId;
	}

	/**
	 * @return the sPassword
	 */
	public String getsPassword() {
		return sPassword;
	}

	/**
	 * @return the sName
	 */
	public String getsName() {
		return sName;
	}

	/**
	 * @return the iAge
	 */
	public int getiAge() {
		return iAge;
	}

	/**
	 * @return the sAddress
	 */
	public String getsAddress() {
		return sAddress;
	}

	/**
	 * @return the sProperty
	 */
	public String getsProperty() {
		return sProperty;
	}

	/**
	 * @return the dMoney
	 */
	public double getdMoney() {
		return dMoney;
	}
	
	
	
}
