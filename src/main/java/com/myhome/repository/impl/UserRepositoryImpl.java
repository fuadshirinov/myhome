package com.myhome.repository.impl;

import com.myhome.domain.Notification;
import com.myhome.domain.Role;
import com.myhome.domain.TokenType;
import com.myhome.domain.User;
import com.myhome.repository.CommonRepository;
import com.myhome.repository.SqlQuery;
import com.myhome.repository.UserRepository;
import com.myhome.repository.rowMapper.RoleRowMapper;
import com.myhome.repository.rowMapper.UserRowMapper;
import com.myhome.service.AdvService;
import com.myhome.service.CommonService;
import com.myhome.service.NotificationService;
import com.myhome.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.*;
import java.util.List;
import java.util.Optional;

@Repository
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private UserRowMapper userRowMapper;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private CommonService commonService;

    @Autowired
    private AdvService advService;

    @Autowired
    private RoleRowMapper roleRowMapper;


    @Value("${myhome.mail.activation.template}")
    private String template;
    @Value("${myhome.mail.activation.link}")
    private String link;
    @Value("${myhome.mail.activation.source}")
    private String source;
    @Value("${myhome.mail.activation.subject}")
    private String subject;
    @Value("${spring.mail.username}")
    private String from;

    @Override
    public Optional<User> getUserByEmail(String email) {
        Optional<User> optionalUser = Optional.empty();
        User user = new User();

        Object[] args = {email};
        List<User> users = jdbcTemplate.query(SqlQuery.GET_USER_BY_EMAIL, args, userRowMapper);
        System.out.println("user rep,users =" +users);
        if (!users.isEmpty()){
            user = users.get(0);
            System.out.println("user rep,user = " + user);
        }
        optionalUser = Optional.of(user);
        return optionalUser;
    }

    @Transactional
    @Override
    public void insertUser(User user) {
        KeyHolder keyHolder = new GeneratedKeyHolder();

        int count = jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(SqlQuery.INSERT_USER, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, user.getName());
                ps.setString(2, user.getSurname());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getMobile());
                ps.setString(5, user.getPassword());

                return ps;
            }
        }, keyHolder);

        user.setId(keyHolder.getKey().longValue());

        if (count == 1) {
            count = commonService.insertUserRole(user.getId(), Role.USER.getId());
            if (count == 1) {
                String token = SecurityUtil.generateToken();
                Object[] args = {user.getId(), token, TokenType.ACTIVATION.getValue()};
                count = jdbcTemplate.update(SqlQuery.INSERT_TOKEN, args);
                if (count == 1) {
                    Notification notification = new Notification();
                    notification.setFrom(from);
                    if (getUserById(user.getId()).isPresent()) {
                        notification.setTo(getUserById(user.getId()).get().getEmail());
                    }
                    notification.setSubject(subject);
                    notification.setContent(String.format(template, user.getName(), user.getSurname()) + "\n" + String.format(link, token));
                    notification.setSource(source);
                    notificationService.insertNotification(notification);
                }
            }
        }
    }

    @Override
    public Optional<User> getUserById(long id) {
        Optional<User> optionalUser = Optional.empty();
        Object[] args = {id};
        List<User> users = jdbcTemplate.query(SqlQuery.GET_USER_BY_ID, args, userRowMapper);
        if (!users.isEmpty()) {
            optionalUser = Optional.of(users.get(0));
        }
        return optionalUser;
    }

    @Override
    public Optional<User> getUserByToken(String token) {
        Object[] args = {token};
        Optional<User> optionalUser = Optional.empty();
        List<User> users = jdbcTemplate.query(SqlQuery.GET_USER_BY_TOKEN,args,userRowMapper);
        if (!users.isEmpty()){
            optionalUser = Optional.of(users.get(0));
        }
        return optionalUser;
    }

    @Override
    public void activateUser(User user) {
        Object[] args = {user.getId()};
        jdbcTemplate.update(SqlQuery.ACTIVATE_USER,args);
    }

    @Override
    public List<Role> getUserRoles(long userID) {
        Object[] args = {userID};
        return jdbcTemplate.query(SqlQuery.GET_USER_ROLES,args,roleRowMapper);
    }

    @Override
    public void updateUser(User user,long userID) {
        Object[] args = {user.getName(),user.getSurname(),user.getEmail(),user.getMobile(),userID};
        int count = jdbcTemplate.update(SqlQuery.UPDATE_USER,args);
    }

    @Override
    @Transactional
    public void deleteUser(User user) {
        Object[] args = {user.getId()};
        int count = jdbcTemplate.update(SqlQuery.DELETE_USER,args);
        if (count == 1){
            count = commonService.deleteSeller(user.getId());
            if (count == 1){
                count = commonService.deleteAllRolesOfUser(user.getId());
                if (count == 1){
                     advService.deleteAdvByUserId(user.getId());
                }
            }
        }
    }

    @Override
    public int getUserCount(int status) {
        Object[] args = {status};
        return jdbcTemplate.queryForObject(SqlQuery.GET_USERS_COUNT,args,Integer.class);
    }

    @Override
    public List<User> getUsersForAdminDatatable(int status, int draw, int start, int length) {
        Object[] args = {status,length,start};

        List<User> userList = jdbcTemplate.query(SqlQuery.GET_USERS_FOR_ADMIN_DATATABLE,args,userRowMapper);
        System.out.println("usrelist == = = = = " + userList);
        return userList;
    }

    @Override
    public Optional<User> getUserByAdvId(long advID) {
        Object[] args = {advID};
        Optional<User> optionalUser = Optional.empty();
        List<User> list = jdbcTemplate.query(SqlQuery.GET_USER_BY_ADV_ID,args,userRowMapper);
        if (!list.isEmpty()){
            optionalUser = Optional.of(list.get(0));
        }
        return optionalUser;
    }

}
