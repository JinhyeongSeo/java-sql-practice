create table Users (
    user_id bigint not null auto_increment primary key ,
    username varchar(255) not null unique ,
    email varchar(255) not null unique ,
    password varchar(255) not null ,
    created_at datetime not null default current_timestamp
);

create table Tags (
                      tag_id bigint not null auto_increment primary key ,
                      name varchar(255) not null unique
);

create table Boards (
                        board_id bigint not null auto_increment primary key ,
                        name varchar(255) not null ,
                        description text
);

create table Posts (
                       post_id bigint not null auto_increment primary key ,
                       title varchar(255) not null ,
                       content text not null ,
                       user_id bigint ,
                       board_id bigint ,
                       created_at datetime not null default current_timestamp ,
                       foreign key (user_id) references Users(user_id) ,
                       foreign key (board_id) references  Boards(board_id)
);

create table Post_Tags (
                           post_id bigint not null ,
                           tag_id bigint not null ,
                           foreign key (post_id) references Posts(post_id) ,
                           foreign key (tag_id) references Tags(tag_id)
);

create table Comments (
                          comment_id bigint not null auto_increment primary key ,
                          content text not null ,
                          user_id bigint ,
                          post_id bigint ,
                          created_at datetime not null default current_timestamp ,
                          foreign key (user_id) references Users(user_id) ,
                          foreign key (post_id) references Posts(post_id)
);




