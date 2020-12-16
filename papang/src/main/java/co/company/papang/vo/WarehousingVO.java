package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class WarehousingVO {
	private String ware_no;
	private String pro_no;
	private String ware_cnt;
	private String ware_date;
	private String ware_note;
}
