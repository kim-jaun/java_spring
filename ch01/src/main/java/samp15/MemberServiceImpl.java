package samp15;

import java.util.Collection;

public class MemberServiceImpl implements MemberService {
	private MemberDao md;
	public void setMd(MemberDao md) {
		this.md = md;
	}
	public int insert(Member member) {
		int result = 0;
		// member2로 한 이유는 입력한데이터 member와 구별하기 위해서
		Member member2 = md.select(member.getId());
		if (member2 == null)
			result = md.insert(member);
		else System.out.println("이미 있는 데이터 입니다");
		return result;
	}
	public Member select(String id) {
		return md.select(id);
	}
	public Collection<Member> list() {
		return md.list();
	}
	public int update(Member member) {
		int result = 0;
		// member2로 한 이유는 입력한데이터 member와 구별하기 위해서
		Member member2 = md.select(member.getId());
		if (member2 != null)
			result = md.insert(member);
		else System.out.println("없는 데이터는 수정 못합니다");
		return result;
	}
	public int delete(String id) {
		int result = 0;
		// member2로 한 이유는 입력한데이터 member와 구별하기 위해서
		Member member2 = md.select(id);
		if (member2 != null)
			result = md.delete(id);
		else System.out.println("없는 데이터는 삭제 못합니다");
		return result;
	}
	
}