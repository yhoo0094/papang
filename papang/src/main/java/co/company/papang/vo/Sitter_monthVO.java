package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data 
@NoArgsConstructor
@AllArgsConstructor
public class Sitter_monthVO {
	private String sit_mbr_id;
	private String srv_date; 
	private String srv_pay;      
	private String month_date;  

}
