package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;

public class jobDAO {
	private Connection conn;

	public jobDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean add_jobs(jobs j) {
		boolean f=false;
		try {
			
			String sql ="insert into jobs(tittle,description,category,status,location) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,j.getTittle());
			ps.setString(2, j.getDescription());
			ps.setString(3,j.getCategory());
			ps.setString(4,j.getStatus());
			ps.setString(5,j.getLocation());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}
	public jobs getJobById(int id){
		
	
	jobs j=null;
	
	try {
		String sql ="select * from jobs where id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			
				{
			j=new jobs();
			j.setId(rs.getInt(1));
			j.setTittle(rs.getString(2));
			j.setDescription(rs.getString(3));
			j.setCategory(rs.getString(4));
			j.setLocation(rs.getString(5));
			j.setPdate(rs.getTimestamp(6)+"");
			j.setStatus(rs.getString(7));
			
				}
				
				
				
		}
	catch(Exception e) {
		e.printStackTrace();
	}
	return j;
	

}
	public List<jobs> getAllJobs(){
		
		
		 List<jobs> list =new ArrayList<jobs>();
		jobs j=null;
		
		try {
			String sql ="select * from jobs order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				
					{
				j=new jobs();
				j.setId(rs.getInt(1));
				j.setTittle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));

				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				list.add(j);
				
					}
					
					
					
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		

	}
	
	public boolean update_jobs(jobs j) {
		boolean f=false;
		try {
			
			String sql ="update jobs set tittle=?,description=?,category=?,status=?,location=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,j.getTittle());
			ps.setString(2, j.getDescription());
			ps.setString(3,j.getCategory());
			ps.setString(4,j.getStatus());
			ps.setString(5,j.getLocation());
			ps.setInt(6, j.getId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}
	public boolean delete_jobs(jobs j) {
		boolean f=false;
		try {
			
			String sql ="delete from jobs where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
		
			ps.setInt(1, j.getId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
}
}

