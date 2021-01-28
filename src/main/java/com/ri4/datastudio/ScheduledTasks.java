package com.ri4.datastudio;

import com.ri4.datastudio.domain.ACharacters;
import com.ri4.datastudio.repos.ACharactersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ScheduledTasks {
    @Autowired
    private ACharactersRepo aCharactersRepo;

//    @Scheduled(fixedRate = 50000)
    public void CharactersUpdate(){
        List<ACharacters> temp = aCharactersRepo.charactersUpdate();
        aCharactersRepo.saveAll(temp);
        System.out.println("Scheduled "+temp.size());
    }

}
