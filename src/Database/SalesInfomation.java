package Database;

public class SalesInfomation {
	private String sMagicStoreId;
	private String sMeterialName;
	private int iStockValue;
	
	public SalesInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SalesInfomation(String sMagicStoreId, String sMeterialName, int iStockValue) {
		super();
		this.sMagicStoreId = sMagicStoreId;
		this.sMeterialName = sMeterialName;
		this.iStockValue = iStockValue;
	}
	
	/**
	 * @return the sMagicStoreId
	 */
	public String getsMagicStoreId() {
		return sMagicStoreId;
	}
	
	/**
	 * @return the sMeterialName
	 */
	public String getsMeterialName() {
		return sMeterialName;
	}
	
	/**
	 * @return the iStockValue
	 */
	public int getiStockValue() {
		return iStockValue;
	}
	
	
}
