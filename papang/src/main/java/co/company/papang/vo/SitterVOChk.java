package co.company.papang.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SitterVOChk {
	private String sit_mbr_id;
	private String sit_payday;
	private String sit_off;
	private String sit_loc;
	private String sit_pay;
	private String sit_age;
	private String sit_note;
	private String sit_pic;
	private String maxPay;
	private String minPay;
}
