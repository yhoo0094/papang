package co.company.papang.vo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data 
@NoArgsConstructor
@AllArgsConstructor
public class SitChiVO {
	private String srv_no;
	private String mbr_id;
	private String chi_name;
	private String chi_gender;
	private String srv_date;
	private String srv_pay;
	
}
