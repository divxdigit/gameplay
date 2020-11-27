package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.authentication.MyUserDetails;
import be.thomasmore.graduaten.gameplay.entity.User;
import be.thomasmore.graduaten.gameplay.repository.UserRepository;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

    @Service
    public class UserDetailsServiceImpl implements UserDetailsService {

        @Autowired
        private UserRepository userRepository;

        @Override
        public UserDetails loadUserByUsername(String email)
                throws UsernameNotFoundException {
            User user = userRepository.findByEmail(email);

            if (user == null) {
                throw new UsernameNotFoundException("Could not find user");
            }

            return new MyUserDetails(user);

}




}
