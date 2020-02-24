package com.pharmacy.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pharmacy.data.ItemDAOImpl;
import com.pharmacy.model.Item;

/**
 * Servlet implementation class ItemController
 */
@WebServlet("/ItemController")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ItemDAOImpl itemUtil=null;
	
	
	
	@Override
	public void init() throws ServletException {
		itemUtil=new ItemDAOImpl();
		
		super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//List<Item> items=itemUtil.getItems();
			//System.out.println(items); to show the output on browser
			String command =request.getParameter("command");//it is use to get the request from add-item-list 
			if(command==null)
			{
				command="LIST";
			}
			switch (command)
			{
			case "LIST":
			listItems(request, response);
				break;
				
			case "ADD":
				addItem(request, response);
				break;
				
			case "LOAD":
				loadItem(request, response);
				break;
				
			case "UPDATE":
			updateItem(request, response);
			break;
				
			case "DELETE":
				deleteItem(request, response);
				break;
				
			case "SEARCH":
			searchName(request, response);
			break;
				
				default:
					listItems(request, response);
					break;
			}
		
		}
		
		
		catch(Exception e)
		{
			throw new ServletException(e);
			//System.out.println(e); to show the error on console
			
		}
	}

		private void searchName(HttpServletRequest request, HttpServletResponse response)
		throws Exception
		{
		String searchName=request.getParameter("searchName").trim();
		List<Item> listitems=itemUtil.searchItems(searchName);
		request.setAttribute("ITEMS_LIST",listitems);		
		//to send the data to jsp page
		RequestDispatcher rd = request.getRequestDispatcher("list-items.jsp");
		rd.forward(request, response);
		
	}

		private void deleteItem(HttpServletRequest request, HttpServletResponse response)
		throws Exception{
			int itemCode= Integer.parseInt(request.getParameter("itemCode"));
			 itemUtil.deleteItem(itemCode);
			 listItems(request, response);
		
	}

		private void updateItem(HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
		throws Exception{
		int itemCode=Integer.parseInt(request.getParameter("itemCode"));
		String itemName= request.getParameter("itemName");
		String unit= request.getParameter("unit");
		int begningInventory=Integer.parseInt(request.getParameter("begningInventory"));
		int quantityOnHand= Integer.parseInt(request.getParameter("quantityOnHand"));
		double pricePerUnit=Double.parseDouble(request.getParameter("pricePerUnit"));
		String dateOfManufacture= request.getParameter("dateOfManufacture");
		String dateOfExpiry= request.getParameter("dateOfExpiry");
		String location= request.getParameter("location");
		String itemCategory= request.getParameter("itemCategory");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dom=new Date();
		dom = sdf.parse(dateOfManufacture);
		
		Date doe=new Date();
		doe= sdf.parse(dateOfExpiry);
		Item item=new Item(itemCode, itemName, unit, begningInventory, quantityOnHand, pricePerUnit, dom, doe, location, itemCategory);
		itemUtil.updateItem(item);//add call, it send back go main page(the item list )
		listItems(request, response);//list call
		}

	private void loadItem(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{
		int itemCode= Integer.parseInt(request.getParameter("itemCode"));
		Item item=itemUtil.getItem(itemCode);
		request.setAttribute("ITEM", item);//to send the data to jsp page
		RequestDispatcher rd = request.getRequestDispatcher("update-item-form.jsp");
		rd.forward(request, response);
	}

	private void addItem(HttpServletRequest request, HttpServletResponse response)
		throws Exception
		{
		String itemName= request.getParameter("itemName");
		String unit= request.getParameter("unit");
		int begningInventory=Integer.parseInt(request.getParameter("begningInventery"));
		int quantityOnHand= Integer.parseInt(request.getParameter("quantityOnHand"));
		double pricePerUnit=Double.parseDouble(request.getParameter("pricePerUnit"));
		String dateOfManufacture= request.getParameter("dateOfManufacture");
		String dateOfExpiry= request.getParameter("dateOfExpiry");
		String location= request.getParameter("location");
		String itemCategory= request.getParameter("itemCategory");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dom=new Date();
		dom = sdf.parse(dateOfManufacture);
		
		Date doe=new Date();
		doe= sdf.parse(dateOfExpiry);
		
		Item item = new Item(itemName, unit, begningInventory, quantityOnHand, pricePerUnit, dom, doe, location, itemCategory);
		itemUtil.addItem(item);//add call, it send back go main page(the item list )
		listItems(request, response);//list call 
	}

	private void listItems(HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<Item> items= itemUtil.getItems();
		request.setAttribute("ITEMS_LIST",items);//it set request for the list
		RequestDispatcher rd=request.getRequestDispatcher("list-items.jsp"); //call to show list
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
