package com.myhome.repository;

public class SqlQuery {

    //COMMON
    public static final String GET_ESTATES = "select id,name,idate,udate,status " +
            "from estate";
    public static final String GET_CITIES = "select id,name,idate,udate,status " +
            "from city";
    public static final String GET_CURRENCIES = "select id,name,idate,udate,status " +
            "from currency";
    public static final String CHECK_EMAIL = "select count(*) " +
            "from user " +
            "where email = ? and status = 1";
    public static final String INSERT_TOKEN = "insert into token (user_id,value,type)" +
            " values(?,?,?)";
    public static final String INSERT_USER_ROLE = " insert into user_role(user_id,role_id) values (?,?)";

    public static final String INSERT_TO_SELLER = "insert into seller(user_id,elan_id) " +
            " values(?,?)";
    public static final String DELETE_SELLER = "update seller " +
            "set status = 0 " +
            "where user_id = ?";
    public static final String DELETE_ALL_ROLES_OF_USER = "update user_role " +
            "set status = 0 " +
            "where user_id = ?";

    //MEDIA
    public static final String ADD_MEDIA = " insert into media(file_name,original_filename,mime_type,file_length,elan_id,main) " +
            "   values(?,?,?,?,?,?)";
    public static final String GET_MEDIA_BY_ID = "select id,file_name,original_filename,mime_type,file_length,elan_id,main,idate,udate,status " +
            "from media " +
            "where ? and status = 1";


    //ADV
    public static final String ADD_ADV = "insert into elan (city_id,price,currency_id,`condition`,elan_type,estate_id,room_count,square,floor,document,full_address,description,wifi,tv,conditioner,heating,phone) " +
            " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";


    public static final String GET_ADV_BY_ID = "select e.id,e.city_id,es.id as estate_id,es.name as estate_name,c.name as city_name,e.price,e.currency_id,cur.name as currency_name,e.elan_type,e.condition,e.estate_id,e.room_count,e.square,e.floor,       " +
            "                                    e.document,e.full_address,e.description,e.status,e.process_status,e.idate,e.udate,e.wifi,e.tv,e.conditioner,e.heating,m.file_name,e.phone       " +
            "                                     from elan e  " +
            "                                      join currency cur on e.currency_id = cur.id     " +
            "                                       join city c on c.id = e.city_id     " +
            "                                       join estate es on e.estate_id = es.id" +
            "                                       join media m on m.elan_id = e.id   " +
            "                                                where e.id = ? and e.status = 1 and m.main = 1";

    public static final String DELETE_ADV_BY_USER_ID = "update elan e  " +
            " join seller s on s.elan_id = e.id " +
            "    set e.status = 0 " +
            "    where s.user_id = ?";
    public static final String GET_USER_ADVS = "select e.id,e.city_id,es.id as estate_id,es.name as estate_name,c.name as city_name,e.price,e.currency_id,cur.name as currency_name,e.elan_type,e.condition,e.estate_id,e.room_count,e.square,e.floor,         " +
            "                                                e.document,e.full_address,e.description,e.status,e.process_status,e.idate,e.udate,e.wifi,e.tv,e.conditioner,e.heating,m.file_name,e.phone         " +
            "                                                 from elan e    " +
            "                                                  join currency cur on e.currency_id = cur.id       " +
            "                                                   join city c on c.id = e.city_id        " +
            "                                                   join estate es on e.estate_id = es.id " +
            "                                                   join seller se on se.elan_id = e.id " +
            "                                                   join media m on m.elan_id = e.id " +
            "                                                            where se.user_id = ? and e.status = 1 and m.main = 1";
    public static final String BASIC_SEARCH = "select e.id,e.city_id,es.id as estate_id,es.name as estate_name,c.name as city_name," +
            "                                   e.price,e.currency_id,cur.name as currency_name,e.elan_type,e.condition,e.estate_id,e.room_count,e.square,e.floor,  " +
            "                                  e.document,e.full_address,e.description,e.status,e.process_status,e.idate,e.udate,e.wifi,e.tv,e.conditioner,e.heating,m.file_name,e.phone   " +
            "                                  from elan e join currency cur on e.currency_id = cur.id        " +
            "                                        join city c on c.id = e.city_id        " +
            "                                        join estate es on e.estate_id = es.id        " +
            "                                       join media m on m.elan_id = e.id     " +
            "                                       where e.status = 1 and e.process_status = 1 " +
            "                                       and (e.room_count between ifnull(?,e.room_count) and ifnull(?,e.room_count)) " +
            "                                       and (e.price between ifnull(?,e.price) and ifnull(?,e.price)) " +
            "                                       and (e.square between ifnull(?,e.square) and ifnull(?,e.square))  " +
            "                                       and (e.elan_type = ifnull(?,e.elan_type)) " +
            "                                       and (e.estate_id = ifnull(?,e.estate_id))    " +
            "                                       and (e.condition = ifnull(?,e.condition))    " +
            "                                       and (e.city_id = ifnull(?,e.city_id)) ";
    public static final String BASIC_SEARCH_RESULT_COUNT = "select count(e.id) " +
            "                           from elan e join currency cur on e.currency_id = cur.id        " +
            "                                        join city c on c.id = e.city_id        " +
            "                                        join estate es on e.estate_id = es.id        " +
            "                                       join media m on m.elan_id = e.id     " +
            "                                       where e.status = 1 and e.process_status = 1 " +
            "                                       and (e.room_count between ifnull(?,e.room_count) and ifnull(?,e.room_count)) " +
            "                                       and (e.price between ifnull(?,e.price) and ifnull(?,e.price)) " +
            "                                       and (e.square between ifnull(?,e.square) and ifnull(?,e.square))  " +
            "                                       and (e.elan_type = ifnull(?,e.elan_type)) " +
            "                                       and (e.estate_id = ifnull(?,e.estate_id))    " +
            "                                       and (e.condition = ifnull(?,e.condition))    " +
            "                                       and (e.city_id = ifnull(?,e.city_id))";
    public static final String ADVS_FOR_ADMIN_DATATABLE = "select e.id,e.city_id,es.id as estate_id,es.name as estate_name,c.name as city_name,e.price,e.currency_id,cur.name as currency_name,e.elan_type,e.condition,e.estate_id,e.room_count,e.square,e.floor,      " +
            "          e.document,e.full_address,e.description,e.status,e.process_status,e.idate,e.udate,e.wifi,e.tv,e.conditioner,e.heating,m.file_name,e.phone     " +
            "          from elan e join currency cur on e.currency_id = cur.id    " +
            "               join city c on c.id = e.city_id    " +
            "               join estate es on e.estate_id = es.id    " +
            "               join media m on m.elan_id = e.id " +
            "               where e.status = 1 and" +
            "               case ? " +
            "                   when -1 then process_status = process_status" +
            "                   when 1 then process_status = 1" +
            "                   when 0 then process_status = 0" +
            "                end" +
            "                   limit ? offset ? ";
    public static final String GET_ADV_AJAX = "select e.id,e.city_id,es.id as estate_id,es.name as estate_name,c.name as city_name,e.price,e.currency_id,cur.name as currency_name,e.elan_type,e.condition,e.estate_id,e.room_count,e.square,e.floor,   " +
            "            e.document,e.full_address,e.description,e.status,e.process_status,e.idate,e.udate,e.wifi,e.tv,e.conditioner,e.heating,m.file_name,e.phone   " +
            "             from elan e join seller s on e.id = s.elan_id   " +
            "              join user u on u.id = s.user_id " +
            "              join currency cur on e.currency_id = cur.id " +
            "              join city c on c.id = e.city_id " +
            "              join estate es on e.estate_id = es.id" +
            "               join media m on m.elan_id = e.id  " +
            "                        where u.id = ? and e.status = 1 and m.main = 1 and " +
            "               case ? " +
            "                   when -1 then e.process_status = e.process_status" +
            "                   when 1 then e.process_status = 1" +
            "                   when 0 then e.process_status = 0" +
            "                end" +
            "                   limit ? offset ? ";
    public static final String ADV_COUNT_FOR_ADMIN_DATATABLE = "select count(*)  " +
            "            from elan " +
            "            where status = 1 and " +
            "            case ? " +
            "       when -1 then process_status = process_status " +
            "       when 1 then process_status = 1 " +
            "       when 0 then process_status = 0 " +
            "            end ";
    public static final String GET_ADV_COUNT_AJAX = "select count(e.id) " +
            " from elan e join seller s on e.id = s.elan_id " +
            " join user u on u.id = s.user_id " +
            "            where u.id = ? and e.status = 1 and " +
            "            case ? " +
            "       when -1 then e.process_status = e.process_status " +
            "       when 1 then e.process_status = 1 " +
            "       when 0 then e.process_status = 0 " +
            "            end ";

    public static final String ACTIVATE_ADV = "update elan " +
            "set process_status = 1 " +
            "where id = ? ";
    public static final String DELETE_ADV = "update elan " +
            " set status = 0 " +
            " where id = ? ";

    public static final String GET_ADV_BY_COUNT = "select e.id,e.city_id,es.id as estate_id,es.name as estate_name,c.name as city_name,e.price,e.currency_id,cur.name as currency_name,e.elan_type,e.condition,e.estate_id,e.room_count,e.square,e.floor,         " +
            "                                                e.document,e.full_address,e.description,e.status,e.process_status,e.idate,e.udate,e.wifi,e.tv,e.conditioner,e.heating,m.file_name,e.phone       " +
            "                                                 from elan e    " +
            "                                                  join currency cur on e.currency_id = cur.id       " +
            "                                                   join city c on c.id = e.city_id       " +
            "                                                   join estate es on e.estate_id = es.id  " +
            "                                                   join media m on e.id = m.elan_id " +
            "                            where e.status = 1 and m.main = 1 and e.process_status = 1 " +
            "                                                limit ?";
    public static final String GET_ALL_ADVS_COUNT = "select count(id) " +
            " from elan " +
            "    where status = 1" ;
    public static final String GET_PENDING_ADVS_COUNT = "select count(id) " +
            " from elan " +
            "    where status = 1 and process_status = 0" ;
    //USER
    public static final String GET_USER_BY_EMAIL = "select id,name,surname,email,mobile,password,process_status,status,idate,udate " +
            "           from user " +
            "           where email = ? and status = 1";
    public static final String GET_USER_BY_ID = "select id,name,surname,email,mobile,idate,udate,password,status,process_status " +
            "            from user " +
            "            where id = ? and status = 1";
    public static final String INSERT_USER = "insert into user (name,surname,email,mobile,password)" +
            " values(?,?,?,?,?)";
    public static final String GET_USER_BY_TOKEN = "select u.id,u.name,u.surname,u.email,u.mobile,u.password,u.process_status,u.status,u.idate,u.udate " +
            " from user u join token t on u.id = t.user_id " +
            "            where t.value = ?";
    public static final String ACTIVATE_USER = "update user  " +
            "               set process_status = 1 " +
            "                where id = ? ";
    public static final String GET_USER_ROLES = "select r.id,r.name,r.success_page " +
            "    from role r join user_role ur on r.id = ur.role_id " +
            "   join user u on ur.user_id = u.id " +
            "                where u.id = ? and r.status = 1" +
            "               order by r.priority desc";
    public static final String UPDATE_USER = "update user " +
            "set name = ? ," +
            " surname = ? ," +
            " email = ? ," +
            " mobile = ? ," +
            " udate = current_timestamp() " +
            "where id = ?";

    public static final String DELETE_USER = "update user " +
            "set status = 0 " +
            "where id = ?";
    public static final String GET_USERS_COUNT = "select count(id) " +
            " from user " +
            "    where status = ?";
    public static final String GET_USERS_FOR_ADMIN_DATATABLE = "select id,name,surname,email,mobile,password,process_status,idate,udate,status " +
            "  from user " +
            "        where status = ?  " +
            "        limit ? offset ?";

    public static final String GET_USER_BY_ADV_ID = "select u.id,u.name,u.surname,u.email,u.mobile,u.password,u.process_status,u.status,u.idate,u.udate " +
            "from user u join seller s on u.id = s.user_id " +
            "   join elan e on e.id = s.elan_id " +
            "            where e.id = ? and u.status = 1 and u.process_status = 1";

    public static final String USERS_COUNT = "select count(id) " +
            " from user " +
            " where status = 1 ";

    //NOTIFICATION
    public static final String INSERT_NOTIFICATION = "insert into notification (`from`,`to`,source_system,subject,content,log_data) " +
            "    values (?,?,?,?,?,?)";
    public static final String GET_PENDING_NOTIFICATIONS = "select id,`from`,`to`,source_system,subject,content,log_data,idate,udate,process_status,status " +
            "from notification " +
            "where process_status = 0" +
            " limit ?";
    public static final String UPDATE_NOTIFICATION = "update notification " +
            "set process_status = ? " +
            "where id = ? ";
}
