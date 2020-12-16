package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class ChildVO {
	private String chi_no;
	private String mbr_id;
	private String chi_birth;
	private String chi_name;
	private String chi_gender;
	private String chi_sns;
	private String chi_pic;
}
