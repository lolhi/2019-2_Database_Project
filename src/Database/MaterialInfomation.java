package Database;

public class MaterialInfomation {
	private String sName;
	private String sOrigin;
	private String sType;
	private int iPrice;
	
	
	public MaterialInfomation() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MaterialInfomation(String sName, String sOrigin, String sType, int iPrice) {
		super();
		this.sName = sName;
		this.sOrigin = sOrigin;
		this.sType = sType;
		this.iPrice = iPrice;
	}


	/**
	 * @return the sName
	 */
	public String getsName() {
		return sName;
	}


	/**
	 * @return the sOrigin
	 */
	public String getsOrigin() {
		return sOrigin;
	}


	/**
	 * @return the sType
	 */
	public String getsType() {
		return sType;
	}


	/**
	 * @return the iPrice
	 */
	public int getiPrice() {
		return iPrice;
	}
	
	
}
