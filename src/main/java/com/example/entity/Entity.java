package com.example.entity;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.sql.Timestamp;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/27
 * Time: 10:50 AM
 */
public class Entity {
	protected boolean blockFlag;
	protected Timestamp createAt;

	public Entity() {
		this.blockFlag = false;
		this.createAt = new Timestamp(System.currentTimeMillis());
	}

	public boolean isBlockFlag() {
		return blockFlag;
	}

	public void setBlockFlag(boolean blockFlag) {
		this.blockFlag = blockFlag;
	}

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	@Override
	public String toString() {
		return JSONObject.toJSONString(this,SerializerFeature.DisableCircularReferenceDetect);
	}
}
