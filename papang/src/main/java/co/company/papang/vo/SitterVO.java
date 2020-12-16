package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class SitterVO {
	private String sit_mbr_id;
	private String sit_payday;
	private String sit_off;
	private String sit_loc;
	private String sit_pay;
	private String sit_age;
	private String sit_note;
	private String sit_pic;
}
