/*
 * 
 * LegendShop 多用户商城系统
 * 
 *  版权所有,并保留所有权利。
 * 
 */
package com.legendshop.business.service.timer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.legendshop.business.common.SubForm;
import com.legendshop.core.dao.support.CriteriaQuery;
import com.legendshop.core.dao.support.PageSupport;
import com.legendshop.model.entity.Basket;
import com.legendshop.model.entity.Sub;

/**
 * 订单服务接口.
 */
public interface SubService {

	/**
	 * 结束超时不付费的订单.
	 */
	public void finishUnPay();

	/**
	 * 结束超时不确认收货的订单.
	 */
	public void finishUnAcklodge();

	/**
	 * 移除已经过期的购物车.
	 */
	public void removeOverTimeBasket();

	/**
	 * Save sub.
	 * 
	 * @param form
	 *            the form
	 * @return the list
	 */
	public List<Sub> saveSub(SubForm form);
	
	// basket_check = Y 表示已经下单了，形成了一条订单
	/**
	 * Gets the basket by sub number.
	 * 
	 * @param subNumber
	 *            the sub number
	 * @return the basket by sub number
	 */
	public abstract List<Basket> getBasketBySubNumber(String subNumber);

	/**
	 * Find sub by sub number.
	 * 
	 * @param subNumber
	 *            the sub number
	 * @return the sub
	 */
	public Sub getSubBySubNumber(String subNumber);
	
	/**
	 * Update sub.
	 * 
	 * @param sub
	 *            the sub
	 */
	public void updateSub(Sub sub);

	/**
	 * Gets the order list.
	 * 
	 * @param cq
	 *            the cq
	 * @return the order list
	 */
	public PageSupport getOrderList(CriteriaQuery cq);
	
	public String getOrderDetail(HttpServletRequest request,  HttpServletResponse response,Sub sub,String userName, String subNumber);
	
	/**
	 * get all pending order
	 * @param userName
	 * @return
	 */
	public abstract Long getTotalProcessingOrder(String userName);
}