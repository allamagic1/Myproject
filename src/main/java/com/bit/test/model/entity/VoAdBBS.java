package com.bit.test.model.entity;

public class VoAdBBS {
	private int idx;
	private String img;
	private String sub;
	private String content;

	public VoAdBBS() {
		// TODO Auto-generated constructor stub
	}

	public VoAdBBS(int idx) {
		super();
		this.idx = idx;
	}

	public VoAdBBS(int idx, String img, String sub, String content) {
		super();
		this.idx = idx;
		this.img = img;
		this.sub = sub;
		this.content = content;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	@Override
	public String toString() {
		return "VoAdBBS [idx=" + idx + ", img=" + img + ", sub=" + sub + ", content=" + content + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + idx;
		result = prime * result + ((img == null) ? 0 : img.hashCode());
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
		VoAdBBS other = (VoAdBBS) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (idx != other.idx)
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (sub == null) {
			if (other.sub != null)
				return false;
		} else if (!sub.equals(other.sub))
			return false;
		return true;
	}
	
}
