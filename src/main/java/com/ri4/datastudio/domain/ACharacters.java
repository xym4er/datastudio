package com.ri4.datastudio.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ACharacters {
    @Id
    private Long pilot_id;
    private Long main_pilot_id;
    private String main_pilot_name;
    private String pilot_name;

    public ACharacters() {
    }

    public Long getPilot_id() {
        return pilot_id;
    }

    public void setPilot_id(Long pilot_id) {
        this.pilot_id = pilot_id;
    }

    public Long getMain_pilot_id() {
        return main_pilot_id;
    }

    public void setMain_pilot_id(Long main_pilot_id) {
        this.main_pilot_id = main_pilot_id;
    }

    public String getMain_pilot_name() {
        return main_pilot_name;
    }

    public void setMain_pilot_name(String main_pilot_name) {
        this.main_pilot_name = main_pilot_name;
    }

    public String getPilot_name() {
        return pilot_name;
    }

    public void setPilot_name(String pilot_name) {
        this.pilot_name = pilot_name;
    }
}
