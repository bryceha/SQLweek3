CREATE DATABASE IF NOT EXISTS users;

USE users;

DROP TABLE IF EXISTS comment_data;
DROP TABLE IF EXISTS post_data;
DROP TABLE IF EXISTS user_data;

CREATE TABLE user_data (
    username VARCHAR(15) not null,
    password VARCHAR(15) not null,
    email_address VARCHAR(30) not null,
    creation_date datetime default current_timestamp,
    primary key(username)
);

CREATE TABLE post_data (
    post_no int(11) not null auto_increment,
    username VARCHAR(15) not null,
    post_time datetime default current_timestamp,
    post_content MEDIUMTEXT,
    primary key(post_no),
    foreign key(username) references user_data(username)
    
);

CREATE TABLE comment_data (
    comment_no int(11) not null auto_increment,
    username VARCHAR(15) not null,
    post_no int(11) not null,
    comment_time datetime default current_timestamp,
    comment_content MEDIUMTEXT,
    primary key(comment_no),
    foreign key(username) references user_data(username),
    foreign key(post_no) references post_data(post_no)
);