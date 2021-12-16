package samp16;

import java.util.Collection;

public interface MemberService {
	int insert(Member member);
	Member select(String id);
	Collection<Member> list();
	int update(Member member);
	int delete(String string);

}