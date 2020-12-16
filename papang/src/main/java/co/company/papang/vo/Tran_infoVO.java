package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tran_infoVO {
	private String mbr_id;
	private String tran_no;
	private String pro_no;
	private String waybill;
	private String tran_date;
	private String tran_status;
}