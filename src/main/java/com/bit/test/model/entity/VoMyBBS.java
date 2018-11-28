package com.bit.test.model.entity;

public class VoMyBBS {
	private String id;
	private int idx;
	
	public VoMyBBS() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "VoMyBBS [id=" + id + ", idx=" + idx + "]";
	}

	public VoMyBBS(String id, int idx) {
		super();
		this.id = id;
		this.idx = idx;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + idx;
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
		VoMyBBS other = (VoMyBBS) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (idx != other.idx)
			return false;
		return true;
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
	
	
}
