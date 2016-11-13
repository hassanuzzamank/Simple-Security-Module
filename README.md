# Simple-Security-Module
1. User can sign up from the home page and first time user is being inactive.
2. Admin can see the inactive user list and approve user by giving role and activating user.
3. Admin can see inactive and active userlist both. 
4. Create Role
5. Create Menu from Configuration file
6. Role can be assigned to user and admin can change user role permission.
7. Menu can't be assigned to the role yet.
8. User can change own password.
9. User can recover password by two method-
	a. by security answer and
	b. by email
10. Validation check-
	i)Check email, if the email is exists in database then user can get recovery method.
	ii)If the answer is wrong then user get error msg.
	iii)Email link sent with 4 parameters-
	a.Email,
	b.Token,
	c.Link Expire Date,
	d.Link is used before.
	iv)If these 4 parameters above has been done then user can reset password.
