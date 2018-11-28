package com.bit.test.model.entity;

public class VoComment {
	private int key;
	private String content;
	private int idx;
	private String id;
	public VoComment() {
		// TODO Auto-generated constructor stub
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "VoComment [key=" + key + ", content=" + content + ", idx=" + idx + ", id=" + id + "]";
	}
	public VoComment(int key, String content, int idx, String id) {
		super();
		this.key = key;
		this.content = content;
		this.idx = idx;
		this.id = id;
	}
	
}
