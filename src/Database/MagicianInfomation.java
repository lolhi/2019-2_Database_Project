package Database;

public class MagicianInfomation {
	private String sId;
	private String sPassword;
	private String sName;
	private int sAge;
	private String sSpecies;
	private String sBirth;
	private String sJob;
	private int sClass;
	private String sProperty;
	private int sMana;
	private double sMoney;
	private String sMagicStore;
	
	public MagicianInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MagicianInfomation(String sId, String sName, int sAge, String sSpecies, String sBirth,
			String sJob, int sClass, String sProperty, int sMana) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sAge = sAge;
		this.sSpecies = sSpecies;
		this.sBirth = sBirth;
		this.sJob = sJob;
		this.sClass = sClass;
		this.sProperty = sProperty;
		this.sMana = sMana;
	}
	
	public MagicianInfomation(String sId, String sName, int sAge, String sSpecies, String sBirth,
			String sJob, int sClass, String sProperty, int sMana, String sMagicStore) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sAge = sAge;
		this.sSpecies = sSpecies;
		this.sBirth = sBirth;
		this.sJob = sJob;
		this.sClass = sClass;
		this.sProperty = sProperty;
		this.sMana = sMana;
		this.sMagicStore = sMagicStore;
	}

	public MagicianInfomation(String sId, String sPassword, String sName, int sAge, String sSpecies, String sBirth,
			String sJob, int sClass, String sProperty, int sMana, double sMoney, String sMagicStore) {
		super();
		this.sId = sId;
		this.sPassword = sPassword;
		this.sName = sName;
		this.sAge = sAge;
		this.sSpecies = sSpecies;
		this.sBirth = sBirth;
		this.sJob = sJob;
		this.sClass = sClass;
		this.sProperty = sProperty;
		this.sMana = sMana;
		this.sMoney = sMoney;
		this.sMagicStore = sMagicStore;
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
	 * @return the sAge
	 */
	public int getsAge() {
		return sAge;
	}

	/**
	 * @return the sSpecies
	 */
	public String getsSpecies() {
		return sSpecies;
	}

	/**
	 * @return the sBirth
	 */
	public String getsBirth() {
		return sBirth;
	}

	/**
	 * @return the sJob
	 */
	public String getsJob() {
		return sJob;
	}

	/**
	 * @return the sClass
	 */
	public int getsClass() {
		return sClass;
	}

	/**
	 * @return the sProperty
	 */
	public String getsProperty() {
		return sProperty;
	}

	/**
	 * @return the sMana
	 */
	public int getsMana() {
		return sMana;
	}

	/**
	 * @return the sMoney
	 */
	public double getsMoney() {
		return sMoney;
	}

	/**
	 * @return the sMagicStore
	 */
	public String getsMagicStore() {
		return sMagicStore;
	}
	
	

}
