package Database;

public class ExecuteInfomation {
	private String sMagicName;
	private String sMaterialName;
	private int iRequireValue;
	
	public ExecuteInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExecuteInfomation(String sMagicName, String sMaterialName, int iRequireValue) {
		super();
		this.sMagicName = sMagicName;
		this.sMaterialName = sMaterialName;
		this.iRequireValue = iRequireValue;
	}

	/**
	 * @return the sMagicName
	 */
	public String getsMagicName() {
		return sMagicName;
	}

	/**
	 * @return the sMaterialName
	 */
	public String getsMaterialName() {
		return sMaterialName;
	}

	/**
	 * @return the iRequireValue
	 */
	public int getiRequireValue() {
		return iRequireValue;
	}
	
	
	
}
