package com.cb.security.service;


import com.istanify.repository.UserRepository;
import com.istanify.model.concrete.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService{
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String  email) throws UsernameNotFoundException {
        User user =  userRepository.findByEmail(email);
        return new UserDetailsImpl(user);
    }
}
