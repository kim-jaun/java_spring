package samp16;

import java.util.Collection;

public interface MemberDao {
	Member select(String id);
	int insert(Member member);
	Collection<Member> list();
	int delete(String id);

}