
<div id="content" class="span10">
			<!-- start: Content -->
			

			<div>
				<hr>
				<ul class="breadcrumb">
					<li>
						<a href="{$baseUrl}dashboard/members_area">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Users</a>
					</li>
				</ul>
				<hr>
			</div>

					<div class="box-content">
						<a class="quick-button span4" href="{$baseUrl}settings/add_user">
							<i class="fa fa-plus-circle"></i>
							<p>ADD USER</p>
						</a>
						<a class="quick-button span4" href="{$baseUrl}settings/exporttoexcel/userlist">
							<i class="fa fa-download"></i>
							<p>EXPORT TO EXCEL</p>
						</a>
					
						<div class="clearfix"></div>
					</div>  
          
			<!-- for error/success info message -->
	        {if $msgInfo}
	        	<br />
	        	<div class="{$msgClass}">
	            	<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
	                <strong>{$msgInfo}</strong>
	            </div>
	        {/if}  
	        
			   <div class="row-fluid sortable">
				<div class="box span12">
                    
					<div class="box-header" data-original-title>
						<h2><i class="icon-group"></i><span class="break"></span>Users</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="icon-wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th width="26%">Name</th>
								  <th width="27%">E-mail Address</th>
								  <th width="26%">Roles</th>
                                  <th width="11%">Status</th>
                                  <th width="10%">Action</th>
								  
							  </tr>
						  </thead>   
						  <tbody>
							{foreach from=$userList item=user}
							
							<tr>
								<td>{$user->fname} {$user->lname}</td>
								<td class="center">{$user->email}</td>
								<td class="center">admin</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								
								<td class="center">
										<a class="btn btn-info" href="{$baseUrl}settings/user_edit/{$user->userid}">
										<i class="icon-edit icon-white"></i>  
									</a>
									<a id="del-user" class="btn btn-danger" href="{$baseUrl}settings/user_delete/{$user->userid}">
										<i class="icon-trash icon-white"></i> 
									</a>
								</td>
							</tr>
							{/foreach}
						  </tbody>
					  </table> 
                          
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
		<hr>
			<!-- end: Content -->
</div><!--/#content.span10-->