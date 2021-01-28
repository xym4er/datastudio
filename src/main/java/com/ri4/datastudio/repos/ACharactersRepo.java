package com.ri4.datastudio.repos;

import com.ri4.datastudio.domain.ACharacters;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ACharactersRepo extends CrudRepository<ACharacters,Long> {

    @Query(value="SELECT" +
            "    mg.main_character_id AS main_pilot_id," +
            "    mg.old_user_id AS pilot_id," +
            "    u.name AS main_pilot_name," +
            "    (SELECT name FROM seat.character_infos WHERE character_id=mg.old_user_id) AS pilot_name" +
            "  FROM" +
            "    seat.users AS u," +
            "    seat.mig_groups AS mg" +
            "  WHERE" +
            "    u.id = mg.new_user_id" +
            "  ;", nativeQuery = true)
    List<ACharacters> charactersUpdate();
}
