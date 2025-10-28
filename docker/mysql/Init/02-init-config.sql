USE `nacos_config`;

-- 插入数据库公共配置
INSERT INTO config_info (data_id, group_id, content, md5, type, encrypted_data_key, tenant_id, gmt_create, gmt_modified)
VALUES
    ('common-database.yaml', 'DEFAULT_GROUP',
     '# 数据库连接池配置
     spring:
       datasource:
         type: com.zaxxer.hikari.HikariDataSource
         hikari:
           minimum-idle: 5
           maximum-pool-size: 15
           auto-commit: true
           connection-timeout: 30000
           idle-timeout: 600000
           max-lifetime: 1800000
           connection-test-query: SELECT 1
           pool-name: AnimeHikariPool

     # MyBatis-Plus 配置
     mybatis-plus:
       configuration:
         map-underscore-to-camel-case: true
         log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl
       type-aliases-package: com.animecommunity.animecommon.entity',
     MD5(CONCAT('配置内容', RAND())),
     'yaml',
     '',
     '',
     NOW(),
     NOW());

-- 插入用户服务开发环境配置
INSERT INTO config_info (data_id, group_id, content, md5, type, encrypted_data_key, tenant_id, gmt_create, gmt_modified)
VALUES
    ('anime-user-service-dev.yaml', 'DEFAULT_GROUP',
     '# 服务基本配置
     server:
       port: 8081

     # 数据源配置
     spring:
       datasource:
         driver-class-name: com.mysql.cj.jdbc.Driver
         url: jdbc:mysql://localhost:3306/anime_user_db?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
         username: root
         password: root

     # MyBatis-Plus 配置
     mybatis-plus:
       mapper-locations: classpath:mapper/*.xml',
     MD5(CONCAT('配置内容', RAND())),
     'yaml',
     '',
     '',
     NOW(),
     NOW());