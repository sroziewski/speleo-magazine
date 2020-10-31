-- ID SEQUENCES

CREATE SEQUENCE poignes_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE cubes_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE thumbnails_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE shunts_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE users_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE rollers_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE helmets_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE lines_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE short_lines_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE bags_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE crolls_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE suspenders_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE clips_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE probes_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE files_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE detectors_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- MAIN TABLES

CREATE TABLE users (
    id bigint NOT NULL DEFAULT nextval('users_sequence'),
    name character varying(255),
    second_name character varying(255),
    email character varying(255),
    full_name text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    is_active boolean
);

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_users_unique_name
    ON users (email);


CREATE TABLE files (
                       id bigint NOT NULL DEFAULT nextval('files_sequence'),
                       thumbnail_id bigint,
                       name text,
                       description text,
                       content_id text,
                       content_length bigint,
                       mimeType character varying(255),
                       created_by_id bigint,
                       updated_by_id bigint,
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       is_published boolean
);

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


CREATE TABLE poignes (
                       id bigint NOT NULL DEFAULT nextval('poignes_sequence'),
                       producer_id character varying(255),
                       club_id character varying(255),
                       content_id character varying(255),
                       description text,
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY poignes
    ADD CONSTRAINT poignes_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_poignes_unique_name
    ON poignes (producer_id);

CREATE UNIQUE INDEX idx_poignes_unique_name2
    ON poignes (club_id);

CREATE TABLE poignes_files (
                       poigne_id bigint NOT NULL,
                       file_id bigint NOT NULL
);

ALTER TABLE ONLY poignes_files
    ADD CONSTRAINT poignes_files_pkey PRIMARY KEY (poigne_id, file_id);

ALTER TABLE ONLY poignes_files
    ADD CONSTRAINT fk_poignes_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY poignes_files
    ADD CONSTRAINT fk_poignes_files_has_poigne FOREIGN KEY (poigne_id) REFERENCES poignes(id);


CREATE TABLE thumbnails (
                            id bigint NOT NULL DEFAULT nextval('thumbnails_sequence'),
                            content_id text
);

ALTER TABLE ONLY thumbnails
    ADD CONSTRAINT thumbnails_pkey PRIMARY KEY (id);

ALTER TABLE ONLY files
    ADD CONSTRAINT fk_file_has_thumbnail FOREIGN KEY (thumbnail_id) REFERENCES thumbnails(id);


CREATE TABLE crolls (
                         id bigint NOT NULL DEFAULT nextval('crolls_sequence'),
                         producer_id character varying(255),
                         club_id character varying(255),
                         description text,
                         created_at timestamp with time zone,
                         updated_at timestamp with time zone,
                         type character varying(255),
                         is_active boolean
);

ALTER TABLE ONLY crolls
    ADD CONSTRAINT crolls_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_crolls_unique_name
    ON crolls (producer_id);

CREATE UNIQUE INDEX idx_crolls_unique_name2
    ON crolls (club_id);

CREATE TABLE crolls_files (
                              croll_id bigint NOT NULL,
                              file_id bigint NOT NULL
);

ALTER TABLE ONLY crolls_files
    ADD CONSTRAINT fk_crolls_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY crolls_files
    ADD CONSTRAINT fk_crolls_files_has_poigne FOREIGN KEY (croll_id) REFERENCES crolls(id);


CREATE TABLE helmets (
                        id bigint NOT NULL DEFAULT nextval('helmets_sequence'),
                        producer_id character varying(255),
                        club_id character varying(255),
                        description text,
                        created_at timestamp with time zone,
                        updated_at timestamp with time zone,
                        type character varying(255),
                        is_active boolean
);

ALTER TABLE ONLY helmets
    ADD CONSTRAINT helmet_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_helmet_unique_name
    ON crolls (producer_id);

CREATE UNIQUE INDEX idx_helmets_unique_name2
    ON crolls (club_id);

CREATE TABLE helmets_files (
                              helmet_id bigint NOT NULL,
                              file_id bigint NOT NULL
);

ALTER TABLE ONLY helmets_files
    ADD CONSTRAINT fk_helmets_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY helmets_files
    ADD CONSTRAINT fk_helmets_files_has_helmet FOREIGN KEY (helmet_id) REFERENCES helmets(id);


CREATE TABLE cubes (
                        id bigint NOT NULL DEFAULT nextval('cubes_sequence'),
                        producer_id character varying(255),
                        club_id character varying(255),
                        description text,
                        created_at timestamp with time zone,
                        updated_at timestamp with time zone,
                        type character varying(255),
                        is_active boolean
);

ALTER TABLE ONLY cubes
    ADD CONSTRAINT cubes_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_cubes_unique_name
    ON cubes (producer_id);

CREATE UNIQUE INDEX idx_cubes_unique_name2
    ON cubes (club_id);

CREATE TABLE cubes_files (
                             cube_id bigint NOT NULL,
                              file_id bigint NOT NULL
);

ALTER TABLE ONLY cubes_files
    ADD CONSTRAINT fk_cubes_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY cubes_files
    ADD CONSTRAINT fk_cubes_files_has_cube FOREIGN KEY (cube_id) REFERENCES cubes(id);


CREATE TABLE rollers (
                        id bigint NOT NULL DEFAULT nextval('rollers_sequence'),
                        producer_id character varying(255),
                        club_id character varying(255),
                        description text,
                        created_at timestamp with time zone,
                        updated_at timestamp with time zone,
                        type character varying(255),
                        is_active boolean
);

ALTER TABLE ONLY rollers
    ADD CONSTRAINT rollers_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_rollers_unique_name
    ON rollers (producer_id);

CREATE UNIQUE INDEX idx_rollers_unique_name2
    ON rollers (club_id);

CREATE TABLE rollers_files (
                               roller_id bigint NOT NULL,
                              file_id bigint NOT NULL
);

ALTER TABLE ONLY rollers_files
    ADD CONSTRAINT fk_rollers_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY rollers_files
    ADD CONSTRAINT fk_rollers_files_has_roller FOREIGN KEY (roller_id) REFERENCES rollers(id);


CREATE TABLE shunts (
                        id bigint NOT NULL DEFAULT nextval('shunts_sequence'),
                        producer_id character varying(255),
                        club_id character varying(255),
                        description text,
                        created_at timestamp with time zone,
                        updated_at timestamp with time zone,
                        type character varying(255),
                        is_active boolean
);

ALTER TABLE ONLY shunts
    ADD CONSTRAINT shunts_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_shunts_unique_name
    ON shunts (producer_id);

CREATE UNIQUE INDEX idx_shunts_unique_name2
    ON shunts (club_id);

CREATE TABLE shunts_files (
                              shunt_id bigint NOT NULL,
                              file_id bigint NOT NULL
);

ALTER TABLE ONLY shunts_files
    ADD CONSTRAINT fk_shunts_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY shunts_files
    ADD CONSTRAINT fk_shunts_files_has_shunt FOREIGN KEY (shunt_id) REFERENCES shunts(id);


CREATE TABLE lines (
                        id bigint NOT NULL DEFAULT nextval('lines_sequence'),
                        producer_id character varying(255),
                        club_id character varying(255),
                        description text,
                        created_at timestamp with time zone,
                        updated_at timestamp with time zone,
                        type character varying(255),
                        is_active boolean
);

ALTER TABLE ONLY lines
    ADD CONSTRAINT lines_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_lines_unique_name
    ON lines (producer_id);

CREATE UNIQUE INDEX idx_lines_unique_name2
    ON lines (club_id);

CREATE TABLE lines_files (
                             line_id bigint NOT NULL,
                              file_id bigint NOT NULL
);

ALTER TABLE ONLY lines_files
    ADD CONSTRAINT fk_lines_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY lines_files
    ADD CONSTRAINT fk_lines_files_has_line FOREIGN KEY (line_id) REFERENCES lines(id);


CREATE TABLE short_lines (
                       id bigint NOT NULL DEFAULT nextval('short_lines_sequence'),
                       producer_id character varying(255),
                       club_id character varying(255),
                       line_id bigint,
                       description text,
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY short_lines
    ADD CONSTRAINT short_lines_pkey PRIMARY KEY (id);

ALTER TABLE ONLY short_lines
    ADD CONSTRAINT fk_short_lines_is_from_line FOREIGN KEY (line_id) REFERENCES lines(id);

CREATE UNIQUE INDEX idx_short_lines_unique_name
    ON short_lines (producer_id);

CREATE UNIQUE INDEX idx_short_lines_unique_name2
    ON short_lines (club_id);

CREATE TABLE short_lines_files (
                               short_lines_id bigint NOT NULL,
                             file_id bigint NOT NULL
);

ALTER TABLE ONLY short_lines_files
    ADD CONSTRAINT fk_short_lines_files_has_file FOREIGN KEY (short_lines_id) REFERENCES files(id);

ALTER TABLE ONLY short_lines_files
    ADD CONSTRAINT fk_lines_files_has_line FOREIGN KEY (short_lines_id) REFERENCES short_lines(id);


CREATE TABLE bags (
                       id bigint NOT NULL DEFAULT nextval('bags_sequence'),
                       club_id character varying(255),
                       description text,
                       volume bigint,
                       color character varying(255),
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY bags
    ADD CONSTRAINT bags_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_bags_unique_name
    ON bags (club_id);

CREATE TABLE bags_files (
                            bag_id bigint NOT NULL,
                             file_id bigint NOT NULL
);

ALTER TABLE ONLY bags_files
    ADD CONSTRAINT fk_bags_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY bags_files
    ADD CONSTRAINT fk_bags_files_has_bag FOREIGN KEY (bag_id) REFERENCES bags(id);


CREATE TABLE suspenders (
                       id bigint NOT NULL DEFAULT nextval('suspenders_sequence'),
                       club_id character varying(255),
                       description text,
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY suspenders
    ADD CONSTRAINT suspenders_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_suspenders_unique_name
    ON suspenders (club_id);

CREATE TABLE suspenders_files (
                              suspender_id bigint NOT NULL,
                             file_id bigint NOT NULL
);

ALTER TABLE ONLY suspenders_files
    ADD CONSTRAINT fk_suspenders_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY suspenders_files
    ADD CONSTRAINT fk_suspenders_files_has_suspender FOREIGN KEY (suspender_id) REFERENCES suspenders(id);


CREATE TABLE clips (
                       id bigint NOT NULL DEFAULT nextval('clips_sequence'),
                       producer_id character varying(255),
                       club_id character varying(255),
                       description text,
                       clip_type character varying(255),
                       shape_type character varying(255),
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY clips
    ADD CONSTRAINT clips_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_clips_unique_name
    ON clips (producer_id);

CREATE UNIQUE INDEX idx_clips_unique_name2
    ON clips (club_id);

CREATE TABLE clips_files (
                             clip_id bigint NOT NULL,
                             file_id bigint NOT NULL
);

ALTER TABLE ONLY clips_files
    ADD CONSTRAINT fk_clips_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY clips_files
    ADD CONSTRAINT fk_clips_files_has_clip FOREIGN KEY (clip_id) REFERENCES clips(id);


CREATE TABLE detectors (
                       id bigint NOT NULL DEFAULT nextval('detectors_sequence'),
                       producer_id character varying(255),
                       club_id character varying(255),
                       description text,
                       number_of_antennas int,
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY detectors
    ADD CONSTRAINT detectors_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_detectors_unique_name
    ON detectors (producer_id);

CREATE UNIQUE INDEX idx_detectors_unique_name2
    ON detectors (club_id);

CREATE TABLE detectors_files (
                             detector_id bigint NOT NULL,
                             file_id bigint NOT NULL
);

ALTER TABLE ONLY detectors_files
    ADD CONSTRAINT fk_detectors_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY detectors_files
    ADD CONSTRAINT fk_detectors_files_has_detector FOREIGN KEY (detector_id) REFERENCES detectors(id);


CREATE TABLE probes (
                       id bigint NOT NULL DEFAULT nextval('probes_sequence'),
                       producer_id character varying(255),
                       club_id character varying(255),
                       description text,
                       created_at timestamp with time zone,
                       updated_at timestamp with time zone,
                       type character varying(255),
                       is_active boolean
);

ALTER TABLE ONLY probes
    ADD CONSTRAINT probes_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_probes_unique_name
    ON probes (producer_id);

CREATE UNIQUE INDEX idx_probes_unique_name2
    ON probes (club_id);

CREATE TABLE probes_files (
                          probe_id bigint NOT NULL,
                             file_id bigint NOT NULL
);

ALTER TABLE ONLY probes_files
    ADD CONSTRAINT fk_probe_files_has_file FOREIGN KEY (file_id) REFERENCES files(id);

ALTER TABLE ONLY probes_files
    ADD CONSTRAINT fk_probes_files_has_probe FOREIGN KEY (probe_id) REFERENCES probes(id);

