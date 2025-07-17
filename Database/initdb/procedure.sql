
USE `schema`;

-- User Procedures

--verify user credentials --return true
create PROCEDURE verify_user_credentials(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    DECLARE user_count INT;
    SELECT COUNT(*) INTO user_count FROM User WHERE username = p_username AND password = p_password;
    IF user_count > 0 THEN
        SELECT 'true' AS result;
    ELSE
        SELECT 'false' AS result;
    END IF;
END;

--add product to inventory procedure
CREATE PROCEDURE add_product_to_inventory(IN p_name VARCHAR(100), IN dept VARCHAR(50), IN price DECIMAL(10, 2), IN quantity INT, IN distributer VARCHAR(100))
BEGIN
    INSERT INTO Product (P_name, Dept, price, Quantity) VALUES (p_name, dept, price, quantity);
END;



-- change product price
CREATE PROCEDURE change_product_price(IN p_id INT, IN new_price DECIMAL(10, 2))
BEGIN
    UPDATE Product SET price = new_price WHERE P_ID = p_id;
END;

--change product quantity quantity
CREATE PROCEDURE change_product_quantity(IN p_id INT, IN by_amount INT)
BEGIN
    UPDATE Product SET Quantity = Quantity + by_amount WHERE P_ID = p_id;
END;

-- remove prodcut inventory
CREATE PROCEDURE remove_product_from_inventory(IN p_id INT)
BEGIN
    update Product SET Quantity = 0 WHERE P_ID = p_id;
END;


-- get a product by id
CREATE PROCEDURE get_product_by_id(IN p_id INT)
BEGIN
    SELECT * FROM Product WHERE P_ID = p_id;
END;

-- get all products
CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM Product;
END;

--set produtt quantity
CREATE PROCEDURE set_product_quantity(IN p_id INT, IN new_quantity INT)
BEGIN
    UPDATE Product SET Quantity = new_quantity WHERE P_ID = p_id;
END;

--create invoice
CREATE PROCEDURE create_invoice(IN date DATE, IN time TIME, IN status ENUM('paid', 'pending', 'canceled'))
BEGIN
    INSERT INTO Invoice (Date, Time, Status) VALUES (date, time, status);
END;

--add product to invoice
CREATE PROCEDURE add_product_to_invoice(IN p_id INT, IN i_id INT, IN quantity INT)
BEGIN
    INSERT INTO Product_Invoice (P_ID, I_ID, Quantity) VALUES (p_id, i_id, quantity);
END;
