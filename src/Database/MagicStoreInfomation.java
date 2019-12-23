package Database;

public class MagicStoreInfomation {
	private String sId;
	private String sPassword;
	private String sStoreName;
	private String sAddress;
	private String sRepresentative;
	private int iMaxClass;
	private double dMoney;
	
	public MagicStoreInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MagicStoreInfomation(String sStoreName, String sAddress,
			String sRepresentative, int iMaxClass, double dMoney) {
		super();
		this.sStoreName = sStoreName;
		this.sAddress = sAddress;
		this.sRepresentative = sRepresentative;
		this.iMaxClass = iMaxClass;
		this.dMoney = dMoney;
	}

	public MagicStoreInfomation(String sId, String sPassword, String sStoreName, String sAddress,
			String sRepresentative, int iMaxClass, double dMoney) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sStoreName = sStoreName;
		this.sAddress = sAddress;
		this.sRepresentative = sRepresentative;
		this.iMaxClass = iMaxClass;
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
	 * @return the sStoreName
	 */
	public String getsStoreName() {
		return sStoreName;
	}

	/**
	 * @return the sAddress
	 */
	public String getsAddress() {
		return sAddress;
	}

	/**
	 * @return the sRepresentative
	 */
	public String getsRepresentative() {
		return sRepresentative;
	}

	/**
	 * @return the iMaxClass
	 */
	public int getiMaxClass() {
		return iMaxClass;
	}

	/**
	 * @return the dMoney
	 */
	public double getdMoney() {
		return dMoney;
	}
	
	
	
}
