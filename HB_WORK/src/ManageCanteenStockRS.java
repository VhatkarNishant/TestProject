import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JOptionPane;


public class ManageCanteenStockRS {

	public static void main(String[] args) {

		
		
		
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cantin","root","system");//
		
			//spc_online18_19
			//String qry="select sr_no ,p_qty,stock,exp_qty,damag_qty,sellqty,total_amt,sellingstock from purchase_entery";
			String qry2="select sr_no,system_id,system_entery,sup_name,invoice_no,invoie_date,r_date,p_date,r_month,r_time,p_tye,p_barecode,p_alis,p_name,p_hsn,p_qty,p_unit,p_rate,p_total,p_dis,\r\n" + 
					"tax_val,cgst_rate,cgst_val,sgst_rate,sgst_val,igst_rate,igst_val,total_amt,user,p_salamt,enter_type,invo_sqldate,batchno,defbarcode,taxable_rate,sellingrate,mrp,\r\n" + 
					"marginper,marginrs,exp_date,sold,stock,stockamt,system_billno,company,entery_by,bonus_qty,exp_qty,exp_amount,damag_qty,damage_amount,sellQty,sellingsold,sellingstock\r\n" + 
					"from purchase_entery where sellingstock>0";
			JOptionPane.showMessageDialog(null, "Operation started");
			Statement st=con.createStatement();
			
			
			ResultSet rs=st.executeQuery(qry2);
			while(rs.next())
			{
				
		String sr_no=rs.getString(1);   		String system_id=rs.getString(2);    	String system_entery=rs.getString(3); 	String sup_name=rs.getString(4); 
		String invoice_no=rs.getString(5);      String invoie_date=rs.getString(6);  	String r_date=rs.getString(7);      	String p_date=rs.getString(8);
		String r_month=rs.getString(9);         String r_time=rs.getString(10);         String p_tye=rs.getString(11);      	String p_barecode=rs.getString(12);
		String p_alis=rs.getString(13);         String p_name=rs.getString(14);         String p_hsn=rs.getString(15); 	        String p_qty=rs.getString(16);
		String p_unit=rs.getString(17);
		
		String p_rate=rs.getString(18);         String p_total=rs.getString(19);        String p_dis=rs.getString(20); 	        String tax_val=rs.getString(21);
		String cgst_rate=rs.getString(22);      String cgst_val=rs.getString(23);       String sgst_rate=rs.getString(24);  	String sgst_val=rs.getString(25);
		String igst_rate=rs.getString(26);      String igst_val=rs.getString(27);       String total_amt=rs.getString(28); 	    String user=rs.getString(29);
		String p_salamt=rs.getString(30);       String enter_type=rs.getString(31);     String invo_sqldate=rs.getString(32); 	String batchno=rs.getString(33);
		String defbarcode=rs.getString(34);     String taxable_rate=rs.getString(35);   String sellingrate=rs.getString(36); 	String mrp=rs.getString(37);
		String marginper=rs.getString(38);      String marginrs=rs.getString(39);       String exp_date=rs.getString(40); 	    String sold=rs.getString(41);
		String stock=rs.getString(42);
		
		String stockamt=rs.getString(43);       String system_billno=rs.getString(44);  String company=rs.getString(45);    	String entery_by=rs.getString(46);
		String bonus_qty=rs.getString(47);      String exp_qty=rs.getString(48);        String exp_amount=rs.getString(49); 	String damag_qty=rs.getString(50);
		String damage_amount=rs.getString(51);  String sellQty=rs.getString(52);        String sellingsold=rs.getString(53); 	String sellingstock=rs.getString(54);
		
		try
		{
		PreparedStatement ps=con.prepareStatement("insert into purchase_entery2 values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		ps.setString(1, sr_no);    			ps.setString(2, system_id);         ps.setString(3, system_entery);    	ps.setString(4, sup_name);      
		ps.setString(5, invoice_no);    	ps.setString(6, invoie_date);      	ps.setString(7, r_date);    		ps.setString(8, p_date);      
		ps.setString(9, r_month);    		ps.setString(10, r_time);      	    ps.setString(11, p_tye);   			ps.setString(12, p_barecode);      
		ps.setString(13, p_alis);   		ps.setString(14, p_name);      	    ps.setString(15, p_hsn);    		ps.setString(16, p_qty); 
		ps.setString(17, p_unit);
		
		ps.setString(18, p_rate);   		ps.setString(19, p_total);      	ps.setString(20, p_dis);   			ps.setString(21, tax_val);      
		ps.setString(22, cgst_rate);        ps.setString(23, cgst_val);      	ps.setString(24, sgst_rate);   		ps.setString(25, sgst_val);      
		ps.setString(26, igst_rate);        ps.setString(27, igst_val);      	ps.setString(28, total_amt);    	ps.setString(29, user);      
		ps.setString(30, p_salamt);         ps.setString(31, enter_type);      	ps.setString(32, invo_sqldate);    	ps.setString(33, batchno);      
		ps.setString(34, defbarcode);       ps.setString(35, taxable_rate);     ps.setString(36, sellingrate);    	ps.setString(37, mrp);      
		ps.setString(38, marginper);        ps.setString(39, marginrs);      	ps.setString(40, exp_date);    		ps.setString(41, sold);      
		
		ps.setString(42, stock);
		ps.setString(43, stockamt);         ps.setString(44, system_billno);    ps.setString(45, company);    		ps.setString(46, entery_by);      
		ps.setString(47, bonus_qty);        ps.setString(48, exp_qty);      	ps.setString(49, exp_amount);    	ps.setString(50, damag_qty);      
		ps.setString(51, damage_amount);    ps.setString(52, sellQty);      	ps.setString(53, sellingsold);    	ps.setString(54, sellingstock);      
	

        int k=ps.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		}
				
			JOptionPane.showMessageDialog(null, "Operation Done");
		} catch (Exception e) {
			// TODO: handle exception
			JOptionPane.showMessageDialog(null, "wait"+e);
			
			JOptionPane.showMessageDialog(null, "Operation Done");
		}


		
	}

}
