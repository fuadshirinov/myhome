package com.myhome.repository.impl;

import com.myhome.domain.Adv;
import com.myhome.domain.BasicSearch;
import com.myhome.domain.DataTableResult;
import com.myhome.domain.User;
import com.myhome.repository.AdvRepository;
import com.myhome.repository.SqlQuery;
import com.myhome.repository.rowMapper.AdvRowMapper;
import com.myhome.util.FileUtility;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.text.html.Option;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Optional;

@Repository
public class AdvRepositoryImpl implements AdvRepository {
    private Logger logger = LogManager.getLogger(AdvRepositoryImpl.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Value("${upload.folder}")
    private String uploadFolder;

    @Autowired
    private AdvRowMapper advRowMapper;

    @Transactional
    @Override
    public void addAdv(Adv adv, long userID) {

        KeyHolder keyHolder = new GeneratedKeyHolder();
        int count = jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(SqlQuery.ADD_ADV, Statement.RETURN_GENERATED_KEYS);

                ps.setLong(1, adv.getCity().getId());
                ps.setBigDecimal(2, adv.getPrice());
                ps.setLong(3, adv.getCurrency().getId());
                ps.setInt(4, adv.getCondition().getValue());
                ps.setInt(5, adv.getType().getValue());
                ps.setLong(6, adv.getEstate().getId());
                ps.setInt(7, adv.getRoom());
                ps.setBigDecimal(8, adv.getSquare());
                ps.setInt(9, adv.getFloor());
                ps.setInt(10, adv.isDocument() ? 1 : 0);
                ps.setString(11, adv.getFullAddress());
                ps.setString(12, adv.getDetail());
                ps.setInt(13, adv.isWifi() ? 1 : 0);
                ps.setInt(14, adv.isTv() ? 1 : 0);
                ps.setInt(15, adv.isConditioner() ? 1 : 0);
                ps.setInt(16, adv.isHeating() ? 1 : 0);
                ps.setInt(17,adv.isPhone() ? 1: 0);

                return ps;
            }
        }, keyHolder);

        long advID = keyHolder.getKey().longValue();
        adv.getMedia().setAdvId(advID);

        if (count == 1) {

            try {
                String newFilename = String.format("myhome-%d-%d-%d%s",
                        adv.getMedia().getAdvId(),
                        LocalDateTime.now().toEpochSecond(ZoneOffset.UTC),
                        LocalDateTime.now().getNano(),
                        FileUtility.getFileExtension(adv.getMedia().getOriginalFileName()));

                String newFilePath = uploadFolder + File.separator + adv.getMedia().getAdvId() + File.separator + newFilename;
                Path path = Paths.get(newFilePath);
                if (!Files.exists(path.getParent())) {
                    Files.createDirectory(path.getParent());
                }
                Files.copy(adv.getMedia().getInputStream(), path);
                String relativeFilePath = adv.getMedia().getAdvId() + File.separator + newFilename;
                adv.getMedia().setFilename(relativeFilePath);

            } catch (Exception e) {
                logger.error(e.getMessage());
                e.printStackTrace();
                throw new RuntimeException(e);
            }

            String filename = adv.getMedia().getFilename();
            String originalFileName = adv.getMedia().getOriginalFileName();
            String mimeType = adv.getMedia().getMimeType();
            long length = adv.getMedia().getFileLength();
            int main = adv.getMedia().isMain() ? 1 : 0;

            Object[] args = {filename, originalFileName, mimeType, length, advID, main};

            count = jdbcTemplate.update(SqlQuery.ADD_MEDIA, args);

            if (count == 1) {
                Object[] params = {userID, advID};
                count = jdbcTemplate.update(SqlQuery.INSERT_TO_SELLER, params);
                logger.info(userID + " id-li user " + advID + " id-li elan yerlesdirdi");
            }
        }
    }

    @Override
    public int getAdvCount(long userID, int processStatus) {
        Object[] args = {userID, processStatus};
        int count = jdbcTemplate.queryForObject(SqlQuery.GET_ADV_COUNT_AJAX, args, Integer.class);
        return count;
    }

    @Override
    public List<Adv> getAdvAjax(long userID, int processStatus, int start, int length) {
        Object[] args = {userID, processStatus, length, start};
        List<Adv> list = jdbcTemplate.query(SqlQuery.GET_ADV_AJAX, args, advRowMapper);
        return list;
    }

    @Override
    public Optional<Adv> getAdvById(long advId) {
        Optional<Adv> optionalAdv = Optional.empty();
        Object[] args = {advId};
        List<Adv> list = jdbcTemplate.query(SqlQuery.GET_ADV_BY_ID, args, advRowMapper);
        System.out.println("adv ----------- " + list);
        if (!list.isEmpty()) {
            optionalAdv = Optional.of(list.get(0));
        }
        return optionalAdv;
    }

    @Override
    public boolean deleteAdvByUserId(long userID) {
        Object[] args = {userID};
        int count = jdbcTemplate.update(SqlQuery.DELETE_ADV_BY_USER_ID, args);
        boolean success;
        if (count == 0) {
            success = false;
        } else {
            success = true;
        }
        return success;
    }

    @Override
    public List<Adv> getAdvsForAdminDatatable(int processStatus, int draw, int start, int length) {
        Object[] args = {processStatus, length, start};
        List<Adv> list = jdbcTemplate.query(SqlQuery.ADVS_FOR_ADMIN_DATATABLE, args, advRowMapper);
        return list;
    }

    @Override
    public int advCountForAdminDatatable(int processStatus) {
        Object[] args = {processStatus};
        return jdbcTemplate.queryForObject(SqlQuery.ADV_COUNT_FOR_ADMIN_DATATABLE, args, Integer.class);
    }

    @Override
    public boolean activateAdv(long advID) {
        Object[] args = {advID};
        int count = jdbcTemplate.update(SqlQuery.ACTIVATE_ADV, args);
        boolean success;
        if (count == 1) {
            success = true;
        } else {
            success = false;
        }
        return success;
    }

    @Override
    public boolean deleteAdv(long advID) {
        Object[] args = {advID};
        boolean success;
        int count = jdbcTemplate.update(SqlQuery.DELETE_ADV, args);
        if (count == 1) {
            success = true;
        } else {
            success = false;
        }
        return success;
    }

    @Override
    public List<Adv> getAdvListByUserID(long userID) {
        Object[] args = {userID};
        return jdbcTemplate.query(SqlQuery.GET_USER_ADVS, args, advRowMapper);
    }

    @Override
    public List<Adv> getAdvByCount(int count) {
        Object[] args = {count};
        return jdbcTemplate.query(SqlQuery.GET_ADV_BY_COUNT, args, advRowMapper);
    }

    @Override
    public List<Adv> basicSearch(BasicSearch basicSearch) {
        Object[] args = {basicSearch.getRoomMin(),
                basicSearch.getRoomMax(),
                basicSearch.getPriceMin(),
                basicSearch.getPriceMax(),
                basicSearch.getSquareMin(),
                basicSearch.getSquareMax(),
                basicSearch.getType(),
                basicSearch.getEstateId(),
                basicSearch.getCondition(),
                basicSearch.getCityId(),
        };

        return jdbcTemplate.query(SqlQuery.BASIC_SEARCH,args,advRowMapper);
    }

    @Override
    public int basicSearchResultCount(BasicSearch basicSearch) {
        Object[] args = {basicSearch.getRoomMin(),
                basicSearch.getRoomMax(),
                basicSearch.getPriceMin(),
                basicSearch.getPriceMax(),
                basicSearch.getSquareMin(),
                basicSearch.getSquareMax(),
                basicSearch.getType(),
                basicSearch.getEstateId(),
                basicSearch.getCondition(),
                basicSearch.getCityId()
        };
        return jdbcTemplate.queryForObject(SqlQuery.BASIC_SEARCH_RESULT_COUNT,args,Integer.class);
    }

    @Override
    public int allAdvCount() {
        return jdbcTemplate.queryForObject(SqlQuery.GET_ALL_ADVS_COUNT,Integer.class);
    }

    @Override
    public int allPendingAdvCount() {
        return jdbcTemplate.queryForObject(SqlQuery.GET_PENDING_ADVS_COUNT,Integer.class);
    }
}
