package com.bit.test.model.entity;

import java.sql.Date;

public class VoBBS {
	private String id;
	private int idx;
	private String sub;
	private String content;
	private int hit;
	private Date day;
	public VoBBS() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "VoBBS [id=" + id + ", idx=" + idx + ", sub=" + sub + ", content=" + content + ", hit=" + hit + ", day="
				+ day + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + hit;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + idx;
		result = prime * result + ((sub == null) ? 0 : sub.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VoBBS other = (VoBBS) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		if (hit != other.hit)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (idx != other.idx)
			return false;
		if (sub == null) {
			if (other.sub != null)
				return false;
		} else if (!sub.equals(other.sub))
			return false;
		return true;
	}
	public VoBBS(String id, int idx, String sub, String content, int hit, Date day) {
		super();
		this.id = id;
		this.idx = idx;
		this.sub = sub;
		this.content = content;
		this.hit = hit;
		this.day = day;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	
}
