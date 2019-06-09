package com.ldu.bs.service;

import com.ldu.bs.bean.Ad;
import com.ldu.bs.bean.AdExample;
import com.ldu.bs.dao.AdMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdService {

    @Autowired
    AdMapper adMapper;

    public List<Ad> getAds() {
        AdExample adExample = new AdExample();
        AdExample.Criteria criteria = adExample.createCriteria();
        criteria.andIsOnlineEqualTo("1");

        return adMapper.selectByExample(adExample);
    }

    public List<Ad> getAllAds() {
        return adMapper.selectByExample(null);
    }

    public void addAd(Ad ad) {
        ad.setIsOnline("0");
        adMapper.insertSelective(ad);
    }

    public void updateAd(Ad ad) {
        adMapper.updateByPrimaryKeySelective(ad);
    }

    public Ad getAd(Integer adId) {
        return adMapper.selectByPrimaryKey(adId);
    }
}
