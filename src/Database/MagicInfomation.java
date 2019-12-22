package Database;

public class MagicInfomation {
	private String sName;
	private String sDescribe;
	private int iClass;
	private String sProperty;
	private String sType;
	private int iEffective;
	private int iConsumption;
	private int iPrice;
	private String sMagicianId;
	private String sMagicStoreId;
	
	
	public MagicInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MagicInfomation(String sName, String sDescribe, int iClass, String sProperty, String sType, int iEffective,
			int iConsumption, int iPrice) {
		super();
		this.sName = sName;
		this.sDescribe = sDescribe;
		this.iClass = iClass;
		this.sProperty = sProperty;
		this.sType = sType;
		this.iEffective = iEffective;
		this.iConsumption = iConsumption;
		this.iPrice = iPrice;
	}

	public MagicInfomation(String sName, String sDescribe, int iClass, String sProperty, String sType,
			int iEffective, int iConsumption, int iPrice, String sMagicianId, String sMagicStoreId) {
		super();
		this.sName = sName;
		this.sDescribe = sDescribe;
		this.iClass = iClass;
		this.sProperty = sProperty;
		this.sType = sType;
		this.iEffective = iEffective;
		this.iConsumption = iConsumption;
		this.iPrice = iPrice;
		this.sMagicianId = sMagicianId;
		this.sMagicStoreId = sMagicStoreId;
	}

	/**
	 * @return the sName
	 */
	public String getsName() {
		return sName;
	}


	/**
	 * @return the sDescribe
	 */
	public String getsDescribe() {
		return sDescribe;
	}


	/**
	 * @return the iClass
	 */
	public int getiClass() {
		return iClass;
	}


	/**
	 * @return the sProperty
	 */
	public String getsProperty() {
		return sProperty;
	}


	/**
	 * @return the sType
	 */
	public String getsType() {
		return sType;
	}


	/**
	 * @return the iEffective
	 */
	public int getiEffective() {
		return iEffective;
	}


	/**
	 * @return the iConsumption
	 */
	public int getiConsumption() {
		return iConsumption;
	}


	/**
	 * @return the iPrice
	 */
	public int getiPrice() {
		return iPrice;
	}


	/**
	 * @return the sMagicianId
	 */
	public String getsMagicianId() {
		return sMagicianId;
	}


	/**
	 * @return the sMagicStoreId
	 */
	public String getsMagicStoreId() {
		return sMagicStoreId;
	}

	
	
}
