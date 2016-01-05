package com.ess.common.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.struts2.ServletActionContext;

import com.ess.common.bean.InvestmentDescriptionBean;
import com.ess.common.util.MyDataSource;
import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InvestmentDeclarationAction extends ActionSupport {

	/**
	 * 
	 */
	private InvestmentDescriptionBean choiceBean;
	private MailPusherAction mailpush;

	public MailPusherAction getMailpush() {
		return mailpush;
	}

	public void setMailpush(MailPusherAction mailpush) {
		this.mailpush = mailpush;
	}

	private static final long serialVersionUID = 1L;
	private Map<String, String> session;
	private String lipp1;
	private String lipp2;
	private String lipp3;
	private String ppf1;
	private String ppf2;
	private String ppf3;
	private String nss1;
	private String nss2;
	private String nss3;
	private String nsc1;
	private String nsc2;
	private String nsc3;
	private String cgb1;
	private String cgb2;
	private String cgb3;
	private String lap1;
	private String lap2;
	private String lap3;
	private String elss1;
	private String elss2;
	private String elss3;
	private String npf1;
	private String npf2;
	private String npf3;
	private String db1;
	private String db2;
	private String db3;
	private String hlr1;
	private String hlr2;
	private String hlr3;
	private String ies1;
	private String ies2;
	private String ies3;
	private String imf1;
	private String imf2;
	private String imf3;
	private String tfc1;
	private String tfc2;
	private String tfc3;
	private String jsp1;
	private String jsp2;
	private String jsp3;
	private String mpn1;
	private String mpn2;
	private String mpn3;
	private String mps1;
	private String mps2;
	private String mps3;
	private String ms1;
	private String ms2;
	private String ms3;
	private String mth1;
	private String mth2;
	private String mth3;
	private String mts1;
	private String mts2;
	private String mts3;
	private String mtsc1;
	private String mtsc2;
	private String mtsc3;
	private String tu1;
	private String tu2;
	private String tu3;
	private String tu11;
	private String tu12;
	private String tu13;
	private String datafile;
	private String datafile1;

	public String getDatafile1() {
		return datafile1;
	}

	public void setDatafile1(String datafile1) {
		this.datafile1 = datafile1;
	}

	public String getDatafile() {
		return datafile;
	}

	public void setDatafile(String datafile) {
		this.datafile = datafile;
	}

	public InvestmentDescriptionBean getChoiceBean() {
		return choiceBean;
	}

	public void setChoiceBean(InvestmentDescriptionBean choiceBean) {
		this.choiceBean = choiceBean;
	}

	public String getLipp1() {
		return lipp1;
	}

	public void setLipp1(String lipp1) {
		this.lipp1 = lipp1;
	}

	public String getLipp2() {
		return lipp2;
	}

	public void setLipp2(String lipp2) {
		this.lipp2 = lipp2;
	}

	public String getLipp3() {
		return lipp3;
	}

	public void setLipp3(String lipp3) {
		this.lipp3 = lipp3;
	}

	public String getPpf1() {
		return ppf1;
	}

	public void setPpf1(String ppf1) {
		this.ppf1 = ppf1;
	}

	public String getPpf2() {
		return ppf2;
	}

	public void setPpf2(String ppf2) {
		this.ppf2 = ppf2;
	}

	public String getPpf3() {
		return ppf3;
	}

	public void setPpf3(String ppf3) {
		this.ppf3 = ppf3;
	}

	public String getNss1() {
		return nss1;
	}

	public void setNss1(String nss1) {
		this.nss1 = nss1;
	}

	public String getNss2() {
		return nss2;
	}

	public void setNss2(String nss2) {
		this.nss2 = nss2;
	}

	public String getNss3() {
		return nss3;
	}

	public void setNss3(String nss3) {
		this.nss3 = nss3;
	}

	public String getNsc1() {
		return nsc1;
	}

	public void setNsc1(String nsc1) {
		this.nsc1 = nsc1;
	}

	public String getNsc2() {
		return nsc2;
	}

	public void setNsc2(String nsc2) {
		this.nsc2 = nsc2;
	}

	public String getNsc3() {
		return nsc3;
	}

	public void setNsc3(String nsc3) {
		this.nsc3 = nsc3;
	}

	public String getCgb1() {
		return cgb1;
	}

	public void setCgb1(String cgb1) {
		this.cgb1 = cgb1;
	}

	public String getCgb2() {
		return cgb2;
	}

	public void setCgb2(String cgb2) {
		this.cgb2 = cgb2;
	}

	public String getCgb3() {
		return cgb3;
	}

	public void setCgb3(String cgb3) {
		this.cgb3 = cgb3;
	}

	public String getLap1() {
		return lap1;
	}

	public void setLap1(String lap1) {
		this.lap1 = lap1;
	}

	public String getLap2() {
		return lap2;
	}

	public void setLap2(String lap2) {
		this.lap2 = lap2;
	}

	public String getLap3() {
		return lap3;
	}

	public void setLap3(String lap3) {
		this.lap3 = lap3;
	}

	public String getElss1() {
		return elss1;
	}

	public void setElss1(String elss1) {
		this.elss1 = elss1;
	}

	public String getElss2() {
		return elss2;
	}

	public void setElss2(String elss2) {
		this.elss2 = elss2;
	}

	public String getElss3() {
		return elss3;
	}

	public void setElss3(String elss3) {
		this.elss3 = elss3;
	}

	public String getNpf1() {
		return npf1;
	}

	public void setNpf1(String npf1) {
		this.npf1 = npf1;
	}

	public String getNpf2() {
		return npf2;
	}

	public void setNpf2(String npf2) {
		this.npf2 = npf2;
	}

	public String getNpf3() {
		return npf3;
	}

	public void setNpf3(String npf3) {
		this.npf3 = npf3;
	}

	public String getDb1() {
		return db1;
	}

	public void setDb1(String db1) {
		this.db1 = db1;
	}

	public String getDb2() {
		return db2;
	}

	public void setDb2(String db2) {
		this.db2 = db2;
	}

	public String getDb3() {
		return db3;
	}

	public void setDb3(String db3) {
		this.db3 = db3;
	}

	public String getHlr1() {
		return hlr1;
	}

	public void setHlr1(String hlr1) {
		this.hlr1 = hlr1;
	}

	public String getHlr2() {
		return hlr2;
	}

	public void setHlr2(String hlr2) {
		this.hlr2 = hlr2;
	}

	public String getHlr3() {
		return hlr3;
	}

	public void setHlr3(String hlr3) {
		this.hlr3 = hlr3;
	}

	public String getIes1() {
		return ies1;
	}

	public void setIes1(String ies1) {
		this.ies1 = ies1;
	}

	public String getIes2() {
		return ies2;
	}

	public void setIes2(String ies2) {
		this.ies2 = ies2;
	}

	public String getIes3() {
		return ies3;
	}

	public void setIes3(String ies3) {
		this.ies3 = ies3;
	}

	public String getImf1() {
		return imf1;
	}

	public void setImf1(String imf1) {
		this.imf1 = imf1;
	}

	public String getImf2() {
		return imf2;
	}

	public void setImf2(String imf2) {
		this.imf2 = imf2;
	}

	public String getImf3() {
		return imf3;
	}

	public void setImf3(String imf3) {
		this.imf3 = imf3;
	}

	public String getTfc1() {
		return tfc1;
	}

	public void setTfc1(String tfc1) {
		this.tfc1 = tfc1;
	}

	public String getTfc2() {
		return tfc2;
	}

	public void setTfc2(String tfc2) {
		this.tfc2 = tfc2;
	}

	public String getTfc3() {
		return tfc3;
	}

	public void setTfc3(String tfc3) {
		this.tfc3 = tfc3;
	}

	public String getJsp1() {
		return jsp1;
	}

	public void setJsp1(String jsp1) {
		this.jsp1 = jsp1;
	}

	public String getJsp2() {
		return jsp2;
	}

	public void setJsp2(String jsp2) {
		this.jsp2 = jsp2;
	}

	public String getJsp3() {
		return jsp3;
	}

	public void setJsp3(String jsp3) {
		this.jsp3 = jsp3;
	}

	public String getMpn1() {
		return mpn1;
	}

	public void setMpn1(String mpn1) {
		this.mpn1 = mpn1;
	}

	public String getMpn2() {
		return mpn2;
	}

	public void setMpn2(String mpn2) {
		this.mpn2 = mpn2;
	}

	public String getMpn3() {
		return mpn3;
	}

	public void setMpn3(String mpn3) {
		this.mpn3 = mpn3;
	}

	public String getMps1() {
		return mps1;
	}

	public void setMps1(String mps1) {
		this.mps1 = mps1;
	}

	public String getMps2() {
		return mps2;
	}

	public void setMps2(String mps2) {
		this.mps2 = mps2;
	}

	public String getMps3() {
		return mps3;
	}

	public void setMps3(String mps3) {
		this.mps3 = mps3;
	}

	public String getMs1() {
		return ms1;
	}

	public void setMs1(String ms1) {
		this.ms1 = ms1;
	}

	public String getMs2() {
		return ms2;
	}

	public void setMs2(String ms2) {
		this.ms2 = ms2;
	}

	public String getMs3() {
		return ms3;
	}

	public void setMs3(String ms3) {
		this.ms3 = ms3;
	}

	public String getMth1() {
		return mth1;
	}

	public void setMth1(String mth1) {
		this.mth1 = mth1;
	}

	public String getMth2() {
		return mth2;
	}

	public void setMth2(String mth2) {
		this.mth2 = mth2;
	}

	public String getMth3() {
		return mth3;
	}

	public void setMth3(String mth3) {
		this.mth3 = mth3;
	}

	public String getMts1() {
		return mts1;
	}

	public void setMts1(String mts1) {
		this.mts1 = mts1;
	}

	public String getMts2() {
		return mts2;
	}

	public void setMts2(String mts2) {
		this.mts2 = mts2;
	}

	public String getMts3() {
		return mts3;
	}

	public void setMts3(String mts3) {
		this.mts3 = mts3;
	}

	public String getMtsc1() {
		return mtsc1;
	}

	public void setMtsc1(String mtsc1) {
		this.mtsc1 = mtsc1;
	}

	public String getMtsc2() {
		return mtsc2;
	}

	public void setMtsc2(String mtsc2) {
		this.mtsc2 = mtsc2;
	}

	public String getMtsc3() {
		return mtsc3;
	}

	public void setMtsc3(String mtsc3) {
		this.mtsc3 = mtsc3;
	}

	public String getTu1() {
		return tu1;
	}

	public void setTu1(String tu1) {
		this.tu1 = tu1;
	}

	public String getTu2() {
		return tu2;
	}

	public void setTu2(String tu2) {
		this.tu2 = tu2;
	}

	public String getTu3() {
		return tu3;
	}

	public void setTu3(String tu3) {
		this.tu3 = tu3;
	}

	public String getTu11() {
		return tu11;
	}

	public void setTu11(String tu11) {
		this.tu11 = tu11;
	}

	public String getTu12() {
		return tu12;
	}

	public void setTu12(String tu12) {
		this.tu12 = tu12;
	}

	public String getTu13() {
		return tu13;
	}

	public void setTu13(String tu13) {
		this.tu13 = tu13;
	}

/*	public String getChoiceInsertQuery() {
		return choiceInsertQuery;
	}

	public void setChoiceInsertQuery(String choiceInsertQuery) {
		this.choiceInsertQuery = choiceInsertQuery;
	}

	public int getRst() {
		return rst;
	}

	public void setRst(int rst) {
		this.rst = rst;
	}*/

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Map<String, String> getSession() {
		return session;
	}

	public void setSession(Map<String, String> session) {
		this.session = session;
	}

	// Inserting Choice pay Details to DB
	

	int rst = 0;

	public String investment_Save() {
		
		System.out.println(" I am investment_Save method");
		
		String ret = ERROR;

		Connection conn = null;

		try {

			DataSource dataSource = MyDataSource.getInstance();
			conn = GetConnection.getConnection();

			Map session = ActionContext.getContext().getSession();

			Object id = session.get("empid");
			System.out.println("getting session id====" + id);
			
		

			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
			
			String lipp1 = request.getParameter("lipp1");
			System.out.println("lipp1==="+lipp1);

			
	
			String lipp2 = request.getParameter("lipp2");
			String lipp3 = request.getParameter("lipp3");

			String ppf1 = request.getParameter("ppf1");
			String ppf2 = request.getParameter("ppf2");
			String ppf3 = request.getParameter("ppf3");

			String nss1 = request.getParameter("nss1");
			String nss2 = request.getParameter("nss2");
			String nss3 = request.getParameter("nss3");

			String nsc1 = request.getParameter("nsc1");
			String nsc2 = request.getParameter("nsc2");
			String nsc3 = request.getParameter("nsc3");

			String cgd1 = request.getParameter("cgd1");
			String cgd2 = request.getParameter("cgd2");
			String cgd3 = request.getParameter("cgd3");

			String lap1 = request.getParameter("lap1");
			String lap2 = request.getParameter("lap2");
			String lap3 = request.getParameter("lap3");

			String elss1 = request.getParameter("elss1");
			String elss2 = request.getParameter("elss2");
			String elss3 = request.getParameter("elss3");

			String npf1 = request.getParameter("npf1");
			String npf2 = request.getParameter("npf2");
			String npf3 = request.getParameter("npf3");
			
			
			String db1=request.getParameter("db1");
		    String db2=request.getParameter("db2");
		    String db3=request.getParameter("db3");
		    
		    String hlr1=request.getParameter("hlr1");
		    String hlr2=request.getParameter("hlr2");
		    String hlr3=request.getParameter("hlr3");
		    
		    String ies1=request.getParameter("ies1");
		    String ies2=request.getParameter("ies2");
		    String ies3=request.getParameter("ies3");
		    
		    String imf1=request.getParameter("imf1");
		    String imf2=request.getParameter("imf2");
		    String imf3=request.getParameter("imf3");
		    
		    
		    String tfc1=request.getParameter("tfc1");
		    String tfc2=request.getParameter("tfc2");
		    String tfc3=request.getParameter("tfc3");
		    
		    String jsp1=request.getParameter("jsp1");
		    String jsp2=request.getParameter("jsp2");
		    String jsp3=request.getParameter("jsp3");
		    
		    String mpn1=request.getParameter("mpn1");
		    String mpn2=request.getParameter("mpn2");
		    String mpn3=request.getParameter("mpn3");
		    
		    String mps1=request.getParameter("mps1");
		    String mps2=request.getParameter("mps2");
		    String mps3=request.getParameter("mps3");
		    
		    String ms1=request.getParameter("ms1");
		    String ms2=request.getParameter("ms2");
		    String ms3=request.getParameter("ms3");
		    
		    String mth1=request.getParameter("mth1");
		    String mth2=request.getParameter("mth2");
		    String mth3=request.getParameter("mth3");
		    
		    String mts1=request.getParameter("mts1");
		    String mts2=request.getParameter("mts2");
		    String mts3=request.getParameter("mts3");
		    
		    String mtsc1=request.getParameter("mtsc1");
		    String mtsc2=request.getParameter("mtsc2");
		    String mtsc3=request.getParameter("mtsc3");
		    
		    
		    String tu1=request.getParameter("tu1");
		    String tu2=request.getParameter("tu2");
		    String tu3=request.getParameter("tu3");
		    
		    String tu11=request.getParameter("tu11");
		    String tu12=request.getParameter("tu12");
		    String tu13=request.getParameter("tu13");
		    
		    String datafile1=request.getParameter("datafile1").substring(request.getParameter("datafile1").lastIndexOf("\\") + 1);
		    
		    String datafile=request.getParameter("datafile").substring(request.getParameter("datafile").lastIndexOf("\\") + 1);
		    
		    
		    String insrtQRY="insert into EMP_INVESTMENT_DECLARATION(LIP_80C_PROPOSED_AMOUNT,LIP_8OC_ACTUAL_AMOUNT, LIP_8OC_APROVED_AMOUNT, PPF_8OC_PROPOSED_AMOUNT, PPF_8OC_ACTUAL_AMOUNT,PPF_8OC_APROVED_AMOUNT, NSS_8OC_PROPOSED_AMOUNT,NSS_8OC_ACTUAL_AMOUNT, NSS_8OC_APROVEDL_AMOUNT, NSC_8OC_PROPOSED_AMOUNT,NSC_8OC_ACTUAL_AMOUNT, NSC_8OC_APROVED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,GOVT_INFRA_80CCF_ACTUAL_AMOU,GOVT_INFRA_80CCF_APROVED_AMOU, LIC_80C_PROPOSED_AMOUNT, LIC_8OC_ACTUAL_AMOUNT, LIC_8OC_APROVED_AMOUNT, ELSS_80C_PROPOSED_AMOUNT, ELSS_80C_ACTUAL_AMOUNT,ELSS_80C_APROVED_AMOUNT, NPF_80C_PROPOSED_AMOUNT,NPF_80C_ACTUAL_AMOUNT,NPF_80C_APROVED_AMOUNT, DSNHB_80C_PROPOSED_AMOUNT,DSNHB_80C_ACTUAL_AMOUNT, DSNHB_80C_APROVED_AMOUNT, HLR_80C_PROPOSED_AMOUNT, HLR_80C_ACTUAL_AMOUNT, HLR_80C_APROVED_AMOUNT,ISES_80C_PROPOSED_AMOUNT, ISES_80C_ACTUAL_AMOUNT,ISES_80C_APROVED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,IMF_80C_ACTUAL_AMOUNT,IMF_80C_APROVED_AMOUNT, TFFC_80C_PROPOSED_AMOUNT,TFFC_80C_ACTUAL_AMOUNT, TFFC_80C_APROVED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,LIC_JSF_80CCC_ACTUAL_AMOUNT,LIC_JSF_80CCC_APROVED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCNSC_80D_ACTUAL_AMOUNT,MCNSC_80D_APROVED_AMOUNT, MCSC_80D_PROPOSED_AMOUNT, MCSC_80D_ACTUAL_AMOUNT, MCSC_80D_APROVED_AMOUNT,  MCS_SC_80D_PROPOSED_AMOUNT,MCS_SC_80D_ACTUAL_AMOUNT,MCS_SC_80D_APROVED_AMOUNT, MTHD_SC_80DD_PROPOSED_AMOUNT, MTHD_SC_80DD_ACTUAL_AMOUNT, MTHD_SC_80DD_APROVED_AMOUNT, MTSD_SD_80DDB_PROPOSED_AMOUNT, MTSD_SD_80DDB_ACTUAL_AMOUNT, MTSD_SD_80DDB_APROVED_AMOUNT, MTSDS_SC_80DDB_PROPOSED_AMOUNT,MTSDSC_SC_80DDB_ACTUAL_AMOUNT, MTSDSC_SC_80DDB_APROVED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80C_ACTUAL_AMOUNT,TOTAL_80C_APROVED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT,TOTAL_80_ACTUAL_AMOUNT,TOTAL_80_APROVED_AMOUNT, UPLOADE_INVESTMENT_PROOFS, UPLOADE_HOUSERENT_RECEIPTS, EMP_ID) values('"+lipp1+"','"+lipp2+"','"+lipp3+"' ,'"+ppf1+"','"+ppf2+"','"+ppf3+"' ,'"+nss1+"' ,'"+nss2+"','"+nss3+"','"+nsc1+"' ,'"+nsc2+"','"+nsc3+"','"+cgd1+"' ,'"+cgd2+"' ,'"+cgd3+"','"+lap1+"','"+lap2+"' ,'"+lap3+"','"+elss1+"' ,'"+elss2+"' ,'"+elss3+"','"+npf1+"','"+npf2+"' ,'"+npf3+"' ,'"+db1+"' ,'"+db2+"' ,'"+db3+"','"+hlr1+"' ,'"+hlr2+"' ,'"+hlr3+"','"+ies1+"' ,'"+ies2+"' ,'"+ies3+"' ,'"+imf1+"' ,'"+imf2+"' ,'"+imf3+"' ,'"+tfc1+"','"+tfc2+"','"+tfc3+"','"+jsp1+"' ,'"+jsp2+"','"+jsp3+"','"+mpn1+"' ,'"+mpn2+"' ,'"+mpn3+"' ,'"+mps1+"','"+mps2+"' ,'"+mps3+"' ,'"+ms1+"','"+ms2+"' ,'"+ms3+"' ,'"+mth1+"','"+mth2+"','"+mth3+"' ,'"+mts1+"' ,'"+mts2+"' ,'"+mts3+"' ,'"+mtsc1+"','"+mtsc2+"' ,'"+mtsc3+"' ,'"+tu1+"','"+tu2+"','"+tu3+"','"+tu11+"','"+tu12+"','"+tu13+"','"+datafile1+"','"+datafile+"','"+id+"')";
		    
		    System.out.println("insrtQRY====== "+insrtQRY);
		    
		    Statement stmt=conn.createStatement();	
		    
		    int insrStatus=stmt.executeUpdate(insrtQRY);
			
		   // String choiceInsertQuery = "INSERT INTO EMP_INVESTMENT_DECLARATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		    
		   // insert into EMP_INVESTMENT_DECLARATION
		    //(LIP_80C_PROPOSED_AMOUNT,LIP_8OC_ACTUAL_AMOUNT, LIP_8OC_APROVED_AMOUNT, PPF_8OC_PROPOSED_AMOUNT, PPF_8OC_ACTUAL_AMOUNT,PPF_8OC_APROVED_AMOUNT, NSS_8OC_PROPOSED_AMOUNT,NSS_8OC_ACTUAL_AMOUNT, NSS_8OC_APROVEDL_AMOUNT, NSC_8OC_PROPOSED_AMOUNT,NSC_8OC_ACTUAL_AMOUNT, NSC_8OC_APROVED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,GOVT_INFRA_80CCF_ACTUAL_AMOU,GOVT_INFRA_80CCF_APROVED_AMOU, LIC_80C_PROPOSED_AMOUNT, LIC_8OC_ACTUAL_AMOUNT, LIC_8OC_APROVED_AMOUNT, ELSS_80C_PROPOSED_AMOUNT, ELSS_80C_ACTUAL_AMOUNT,ELSS_80C_APROVED_AMOUNT, NPF_80C_PROPOSED_AMOUNT,NPF_80C_ACTUAL_AMOUNT,NPF_80C_APROVED_AMOUNT, DSNHB_80C_PROPOSED_AMOUNT,DSNHB_80C_ACTUAL_AMOUNT, DSNHB_80C_APROVED_AMOUNT, HLR_80C_PROPOSED_AMOUNT, HLR_80C_ACTUAL_AMOUNT, HLR_80C_APROVED_AMOUNT,ISES_80C_PROPOSED_AMOUNT, ISES_80C_ACTUAL_AMOUNT,ISES_80C_APROVED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,IMF_80C_ACTUAL_AMOUNT,IMF_80C_APROVED_AMOUNT, TFFC_80C_PROPOSED_AMOUNT,TFFC_80C_ACTUAL_AMOUNT, TFFC_80C_APROVED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,LIC_JSF_80CCC_ACTUAL_AMOUNT,LIC_JSF_80CCC_APROVED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCNSC_80D_ACTUAL_AMOUNT,MCNSC_80D_APROVED_AMOUNT, MCSC_80D_PROPOSED_AMOUNT, MCSC_80D_ACTUAL_AMOUNT, MCSC_80D_APROVED_AMOUNT,  MCS_SC_80D_PROPOSED_AMOUNT,MCS_SC_80D_ACTUAL_AMOUNT,MCS_SC_80D_APROVED_AMOUNT, MTHD_SC_80DD_PROPOSED_AMOUNT, MTHD_SC_80DD_ACTUAL_AMOUNT, MTHD_SC_80DD_APROVED_AMOUNT, MTSD_SD_80DDB_PROPOSED_AMOUNT, MTSD_SD_80DDB_ACTUAL_AMOUNT, MTSD_SD_80DDB_APROVED_AMOUNT, MTSDS_SC_80DDB_PROPOSED_AMOUNT,MTSDSC_SC_80DDB_ACTUAL_AMOUNT, MTSDSC_SC_80DDB_APROVED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80C_ACTUAL_AMOUNT,TOTAL_80C_APROVED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT,TOTAL_80_ACTUAL_AMOUNT,TOTAL_80_APROVED_AMOUNT, UPLOADE_INVESTMENT_PROOFS, UPLOADE_HOUSERENT_RECEIPTS, EMP_ID) values('','', '', '', '','', '','', '', '','', '','','','', '', '', '', '', '','', '','','', '','', '', '', '', '','', '','','','','', '','', '','','','','','','', '', '', '',  '','','', '', '', '', '', '', '', '','', '','','','','','','', '', '', '')

		    
		    
		    
		   /* PreparedStatement ps = conn.prepareStatement(choiceInsertQuery);

			System.out.println("choiceInsertQuery======== " + choiceInsertQuery);

			ps.setString(1, lipp1);
			ps.setString(2, lipp2);
			ps.setString(3, lipp3);

			ps.setString(4, ppf1);
			ps.setString(5, ppf2);
			ps.setString(6, ppf3);

			ps.setString(7, nss1);
			ps.setString(8, nss2);
			ps.setString(9, nss3);

			ps.setString(10, nsc1);
			ps.setString(11, nsc2);
			ps.setString(12, nsc3);

			ps.setString(13, cgb1);
			ps.setString(14, cgb2);
			ps.setString(15, cgb3);

			ps.setString(16, lap1);
			ps.setString(17, lap2);
			ps.setString(18, lap3);

			ps.setString(19, elss1);
			ps.setString(20, elss2);
			ps.setString(21, elss3);

			ps.setString(22, npf1);
			ps.setString(23, npf2);
			ps.setString(24, npf3);

			ps.setString(25, db1);
			ps.setString(26, db2);
			ps.setString(27, db3);
			
			ps.setString(28, hlr1);
			ps.setString(29, hlr2);
			ps.setString(30, hlr3);
			
			ps.setString(31, ies1);
			ps.setString(32, ies2);
			ps.setString(33, ies3);
			
			ps.setString(34, imf1);
			ps.setString(35, imf2);
			ps.setString(36, imf3);

			ps.setString(37, tfc1);
			ps.setString(38, tfc2);
			ps.setString(39, tfc3);
			
			ps.setString(40, jsp1);
			ps.setString(41, jsp2);
			ps.setString(42, jsp3);
			
			ps.setString(43, mpn1);
			ps.setString(44, mpn2);
			ps.setString(45, mpn3);
			
			ps.setString(46, mps1);
			ps.setString(47, mps2);
			ps.setString(48, mps3);

			ps.setString(49, ms1);
			ps.setString(50, ms2);
			ps.setString(51, ms3);
			
			ps.setString(52, mth1);
			ps.setString(53, mth2);
			ps.setString(54, mth3);
			
			ps.setString(55, mts1);
			ps.setString(56, mts2);
			ps.setString(57, mts3);
			
			ps.setString(58, mtsc1);
			ps.setString(59, mtsc2);
			ps.setString(60, mtsc3);

			ps.setString(61, tu1);
			ps.setString(62, tu2);
			ps.setString(63, tu3);
			ps.setString(64, tu11);
			ps.setString(65, tu12);
			ps.setString(66, tu13);
			
			
			ps.setString(67,datafile1);
			
			ps.setString(68,datafile);

			ps.setObject(69, id);
			System.out.println("choiceInsertQuery===>> "+choiceInsertQuery);

			//rst = ps.executeUpdate();*/
			

			if (insrStatus> 0) {

				MailPusherAction mp=new MailPusherAction();
				mp.executeMail();

				ret = SUCCESS;
			} else {
				ret = ERROR;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public String investmentDetails() {

		System.out.println("calling investmentDetails==== ()");
		return SUCCESS;

	}

}
